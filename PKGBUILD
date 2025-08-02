# Maintainer: AlphaLynx <AlphaLynx at protonmail dot com>

pkgname=opencommit
pkgver=3.2.9
pkgrel=1
pkgdesc='Auto-generate meaningful commits in a second. Killing lame commits with AI'
arch=('any')
url='https://github.com/di-sukharev/opencommit'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
b2sums=('9d87ff72b6444d040510ae180ab76fbb50425d4c6ef11a1fe48f6e36a224f0bf781016ec61d47a7fb612ecae0318ee3568be53b31161c3b099a97d686858f173')

package() {
    npm install -g --cache npm-cache --omit dev --prefix "$pkgdir/usr" $pkgname-$pkgver.tgz
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /usr/lib/node_modules/$pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
