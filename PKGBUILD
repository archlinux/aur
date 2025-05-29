# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="candy"
pkgname="${_pkgname}-bin"
pkgver=6.0.1
pkgrel=1
pkgdesc="A simple networking tool"
arch=('aarch64' 'armv7h' 'loong64' 'riscv64' 'x86_64')
url="https://github.com/lanthora/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("etc/${_pkgname}.cfg")
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}+linux_aarch64.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}+linux_armhf.tar.gz")
source_loong64=("${_pkgsrc}-loong64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}+linux_loongarch64.tar.gz")
source_riscv64=("${_pkgsrc}-riscv64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}+linux_riscv64.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}+linux_x86_64.tar.gz")
sha256sums=('80e9eace4c80dc740e9d17d64ce2cc5f9b8ca41b057bfe8c2c31e849f8f7aeb5'
            '7abc3e1f887be8cf25e77d95486a22a7b6d62f368e864785d995138db7220dcf')
sha256sums_aarch64=('cb1b9b3a52917d16b2531c54e5ea8fc96626c17d4edfa1669be8e96af95ae862')
sha256sums_armv7h=('5ca0f44b25b656d5ed1ece4e9bdceef99a1c8b30149215a5ddd2f8df52bfad37')
sha256sums_loong64=('fcd2e8ee8a9de4f2d76758c9c58a985fe44eed433d67c1dc5485dc6c50cf3d80')
sha256sums_riscv64=('8a4f305b2f1d914be17552a562e273bab9927423fb916c572265d76d7bb692d1')
sha256sums_x86_64=('daf67d03d3145a8295a2898c1957096183169e2c73aed9b5670a1ec215eef9bd')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgname}.cfg" "${pkgdir}/etc/${_pkgname}.cfg"
  install -vDm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -vDm644 "${_pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}@.service"
}
