# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="candy"
pkgname="${_pkgname}-bin"
pkgver=6.0.4
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
sha256sums_aarch64=('5d38d801d2f551aee9b54f2fae1df4c0caa9aa93775b11d66782f55843119df4')
sha256sums_armv7h=('cd462cf49815953c3761e1b00243508d47e52113e086969291af5de1e87228d0')
sha256sums_loong64=('baba65a85ac07b5689422d53109caf708f99499b972b2eab18801b7e5c2af79a')
sha256sums_riscv64=('1eecbd1817077fc2af488e4381f560e0526c966f2f19ec15b9e58b8468c58a04')
sha256sums_x86_64=('29ae1a776c6f5deeba285c294893222c056f8fb0af8cc17e19be749674ec3c0a')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgname}.cfg" "${pkgdir}/etc/${_pkgname}.cfg"
  install -vDm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -vDm644 "${_pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}@.service"
}
