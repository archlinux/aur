# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="gocheat"
pkgname="${_pkgname}-bin"
pkgver=1.1
pkgrel=1
pkgdesc="A tool to create beautiful cheatsheets for your keybinds and aliases"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/Achno/${_pkgname}"
license=('MIT')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v0.1.1/${_pkgsrc//-/_}_linux_amd64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v0.1.1/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v0.1.1/${_pkgsrc//-/_}_linux_386.tar.gz")
sha256sums_x86_64=('2d7ba2c9ac5167b5391e7a6409e2a81dd6556f5d28f91b94fb9f6d617174d671')
sha256sums_aarch64=('cf37861c847721519b30305f15f52bbfd0ec4b62635ed992c035f45c4bfd1e5f')
sha256sums_i686=('85c25441c923ab2e7dcf2b06a8ddfb16531f1deeebfc46b06b4b192525b80b1f')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
