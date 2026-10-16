# Maintainer: Aleksandrs Stier <aleks.stier@icloud.com>
# Contributor: Axel McLaren <scm(at)axml(dot)uk>
# Contributor: Richard Neumann <r.neumann@homeinfo.de>

pkgname=xhidecursor
pkgver=1.1.1
pkgrel=1
pkgdesc='Hide the X11 cursor on key presses and show it on mouse movement.'
arch=('x86_64')
url='https://github.com/astier/xhidecursor'
license=('MIT')
depends=('glibc' 'libx11' 'libxfixes' 'libxi')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b0780baa66973e659b1f2f33fd06529a59e48dda96efba109a999ddaa95438d8')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
