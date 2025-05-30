# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="candy"
pkgname="${_pkgname}-bin"
pkgver=6.0.2
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
sha256sums_aarch64=('fb6159b5eb160992766c8f2d733831b87c93cb5980c4a36503df6454a7d0ebae')
sha256sums_armv7h=('b3924f0635de7088b4918e6602e6916b0a2e926116d939eefdc1728374ea2657')
sha256sums_loong64=('dc9271fd68d0721e780c29b73b059f4a967372ed1ecd7db40f224532b4fa5aae')
sha256sums_riscv64=('2bc2cc1b498069ca631b82cf5627d44623eb25875a5af7a91e22a2af5e1bb3c4')
sha256sums_x86_64=('5167bc046b0c05b830b52fd343e250aebae38f165c95c289501b8fd853737aa2')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgname}.cfg" "${pkgdir}/etc/${_pkgname}.cfg"
  install -vDm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -vDm644 "${_pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}@.service"
}
