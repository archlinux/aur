# Maintainer: Leonid Kuzin <dg.inc.lcf@gmail.com>

pkgname=tailwindcss
pkgver=3.2.7
pkgrel=1
pkgdesc="A utility-first CSS framework for rapidly building custom user interfaces."
arch=("any")
url="https://tailwindcss.com"
license=("MIT")
depends=('nodejs>=16.0.0' 'npm')
optdepends=()
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha1sums=("5936dd08c250b05180f0944500c01dce19188c07")

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
  chown -R root:root "$pkgdir"
}