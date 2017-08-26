# Maintainer: Jake Howard <git+aur@theorangeone.net>
pkgname=tupload
pkgver=1.0.0
pkgrel=1
pkgdesc="Capture screenshots and upload them using rsync"
arch=('any')
url="https://github.com/RealOrangeOne/tupload"
license=('unknown')
depends=('python-setuptools' 'rsync' 'gnome-screenshot')
makedepends=('python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RealOrangeOne/tupload/archive/$pkgver.tar.gz")
sha512sums=('e18fe97b985acc357b263f733cc5363f46132f56354df20a4868734df847d1cb4af385dd0dd85cf0e2f92a0b1549e4a3f47187cd8a3405f6787594e6c3fff0b9')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 tupload/config.json "$pkgdir"/etc/.upload
}
