# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='inotify-info'
pkgver='0.0.2'
pkgrel='1'
pkgdesc='Linux inotify info reporting app'
arch=('x86_64' 'aarch64')
_uri="github.com/mikesart"
url="https://${_uri}/${pkgname}"
license=('MIT')
depends=('glibc' 'gcc-libs')
conflicts=("${pkgname}-git")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('bda59003afad192ea30276e9bba6506c0e5321aa628581fc3401f03f7314a7e0')

build() {
  cd "${pkgname}-${pkgver}"
  INOTIFYINFO_VERSION="${pkgver}" make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 "_release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
