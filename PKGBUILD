# Maintainer: Sebastien MacDougall-Landry

pkgname=moonvulkan
pkgver=0.9
pkgrel=3
pkgdesc='Lua bindings for Vulkan'
url='https://github.com/stetre/moonvulkan/'
source=("https://github.com/stetre/$pkgname/archive/v$pkgver.tar.gz")
arch=('x86_64')
license=('MIT')
depends=('lua' 'vulkan-icd-loader')
sha256sums=('e56da6f4f487649ca51e0f7139aaf1dbbf450f74dc6abade80cd04ec8fbae8bf')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  make LUAVER=5.4
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  make LUAVER=5.4 PREFIX="$pkgdir/usr" install
}
