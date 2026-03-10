# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='inotify-info'
pkgver='0.0.4'
pkgrel='1'
pkgdesc='Linux inotify info reporting app'
arch=('x86_64' 'aarch64')
_uri="github.com/mikesart"
url="https://${_uri}/${pkgname}"
license=('MIT')
depends=('glibc' 'gcc-libs')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.${_uri}/${pkgname}/tar.gz/refs/tags/v${pkgver}")
sha256sums=('8a44de6a1750863520954770cfc416ae723ffeb3cc5044ec419fa5392a5d22d1')

build() {
  cd "${pkgname}-${pkgver}"
  INOTIFYINFO_VERSION="${pkgver}" make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 "_release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm0644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
