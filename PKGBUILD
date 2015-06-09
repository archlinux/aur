# Maintainer: Marcos Heredia <chelqo@gmail.com>

pkgname=typecatcher
pkgver=0.2
pkgrel=1
pkgdesc="Download Google webfonts for off-line use"
arch=('i686' 'x86_64')
url="https://launchpad.net/typecatcher"
screenshot="http://andrewsomething.files.wordpress.com/2012/11/selection_005.png"
license=('GPL3')
depends=('python3' 'python-distutils-extra' 'python-gobject' 'yelp')
# optdepends=('apport') ???
source=("https://launchpad.net/${pkgname}/${pkgver}/${pkgver}/+download/${pkgname}_${pkgver}.tar.gz")
md5sums=('3900950b2e0f240721545ddedb512566')

build() {
  cd $srcdir/${pkgname}-${pkgver}

  python3 setup.py build
}

package() {
  cd $srcdir/${pkgname}-${pkgver}

  python3 setup.py install --root=$pkgdir --optimize=1

  install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}/
  install -Dpm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/

  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}/
  install -Dpm644 AUTHORS ${pkgdir}/usr/share/doc/${pkgname}/
}
