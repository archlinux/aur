# Maintainer: Hayate Nakamura <is01.njb at gmail dot com>
pkgname=add-pacman-repository
pkgver=0.2.2
pkgrel=1
pkgdesc="Interactive shell script to help adding Pacman repositories."
arch=('any')
url="https://github.com/Jin-Asanami/add-pacman-repository"
license=('GPL3')
depends=('bash' 'wget')
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('fa5556e070eba3f6a9e623b30f9e4450')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
