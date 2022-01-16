# Maintainer alfredjophy <at> protonmail <dot> com
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=swayblur
pkgdesc="Blurs the wallpaper when a client is present"
pkgver=1.1.1
pkgrel=1
url="https://github.com/willpower3309/swayblur"
arch=('any')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('660d4667570b0391d4c7839efb64b280c78b0f12cca0b19bc6c4a98499ef0557')
provides=('swayblur')
makedepends=('python-setuptools' 'python-wheel')
depends=('imagemagick' 'python-i3ipc' 'oguri')
build() {
   cd "$pkgname-$pkgver"
   python setup.py build
}
package(){
   cd "$pkgname-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
   install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
   install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
