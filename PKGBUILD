# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='inotify-info'
pkgver='0.0.1'
pkgrel='1'
pkgdesc='Linux inotify info reporting app'
arch=('x86_64' 'aarch64')
_uri="github.com/mikesart"
url="https://${_uri}/${pkgname}"
license=('MIT')
depends=('glibc' 'gcc-libs')
conflicts=("${pkgname}-git")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('48313463e1cdc903db97e321e8705ed8b5de11df13c9f4adac98334b1c4b2433')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 "_release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
