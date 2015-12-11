# Maintainer: pyriand3r

pkgname=nitrotasks
pkgver=1.5.1
pkgrel=1
pkgdesc="An eyecandy task managment tool"
arch=('any')
url="http://nitrotasks.com/"
license=('BSD')
depends=('pygtk' 'python2' 'python2-gobject' 'webkitgtk')
makedepends=('python2-distutils-extra' 'intltool')
optdepends=('dropbox: Synchronization support [AUR]')
install=$pkgname.install
source=("https://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}_${pkgver}.tar.gz")
md5sums=('f5f59a511d18b17dd291fd7498558c28')

package() {
  cd quickly_trunk

  sed -i 's/Unity,\ //;s/launcher.*/pass/' nitrotasks/NitrotasksWindow.py

  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  find "$pkgdir/" -type f -not -name nitrotasks -exec chmod 644 '{}' \;
}
