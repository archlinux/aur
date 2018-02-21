# Maintainer: Marcos Heredia <chelqo@gmail.com>
# Contributor: Filip Kemuel Dam Bartholdy <filip_kemuel@yahoo.dk>

pkgname=typecatcher
pkgver=0.3
pkgrel=1
pkgdesc="Download Google webfonts for off-line use"
arch=('i686' 'x86_64')
url="https://launchpad.net/typecatcher"
screenshot="http://andrewsomething.files.wordpress.com/2012/11/selection_005.png"
license=('GPL3')
depends=('python3' 'python-distutils-extra' 'python-gobject' 'yelp' 'webkit2gtk' 'gobject-introspection' 'gtk3')
source=("https://github.com/andrewsomething/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('1328a54021d0c575f7e4c4f7331c33cfff361861b065278998f0a186aa92c7b3')

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
