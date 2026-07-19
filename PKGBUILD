# Maintainer: etoq <olhnts12@proton.me>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=tailwindcss
pkgver=4.3.3
pkgrel=1
pkgdesc="A utility-first CSS framework for rapidly building custom user interfaces."
arch=("any")
url="https://tailwindcss.com"
license=("MIT")
depends=('nodejs>=16.0.0' 'npm')
optdepends=()
source=("https://github.com/tailwindlabs/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('608268447ff0c939da732245e0dbd77d24edfe22fa6b705b402626992361b741')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
  chown -R root:root "$pkgdir"
}
