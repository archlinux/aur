# Maintainer alfredjophy <at> protonmail <dot> com
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=swayblur
pkgdesc="Blurs the wallpaper when a client is present"
pkgver=1.1.0
pkgrel=2
url="https://github.com/willpower3309/swayblur"
arch=('any')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a13a68e5c508357c30e9af88fa2fc493490584fe413859e95cfa0aa5bbc5a140')
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
