# Maintainer: Muflone http://url.muflone.com/contacts

pkgname=cpucompare
pkgver=0.6
pkgrel=2
pkgdesc="A GTK+ application to make comparisons between CPU models."
url="http://url.muflone.com/cpucompare"
arch=('any')
license=('GPL2')
depends=('python2' 'gtk3' 'python2-gobject' 'hicolor-icon-theme' 'xdg-utils')
provides=('cpucompare')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('34f5bc355a7a604991a1d96ad23c38e5')
sha1sums=('6f1a45565ba098f964b2d38e4d2132820f2d349f')
sha256sums=('e6c1c43ac5a8c08fc1a2dcd63781e392c50a6115e9ee466545123f5d98d460c9')
install="${pkgname}.install"

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --root "${pkgdir}"
}

