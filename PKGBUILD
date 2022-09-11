# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=i3-layouts
pkgver=0.13.2
pkgrel=3
pkgdesc="Dynamic layouts for i3wm"
arch=('any')
url="https://github.com/eliep/i3-layouts"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'xdotool' 'i3-wm' 'python-i3ipc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('813ae25331e98556b559ec9c6e42f3c08c60ee668da997562af5a9e7bd68efbb')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

