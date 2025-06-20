# Maintainer: Fredrik Magnusson <fredrikmagnusson3@gmail.com>
# Contributor: Pang LAN <wopanglan@gmail.com>

pkgname=opencommit
pkgver=3.2.9
pkgrel=2
pkgdesc='Auto-generate meaningful commits with AI in a second'
arch=('any')
url="https://github.com/di-sukharev/$pkgname"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('44b819d029ad9136899bf8ef979000d5d2e65ad6eb273764ca29dcb23ca6ece5')

package() {
    npm install -g --omit=dev --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "../../../lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: set ts=4 sw=4 sts=4 et:
