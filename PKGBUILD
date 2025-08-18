# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=opencommit
pkgver=3.2.10
pkgrel=1
pkgdesc='Auto-generate meaningful commits in a second. Killing lame commits with AI'
arch=('any')
url='https://github.com/di-sukharev/opencommit'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
b2sums=('124721412253ccf494afe730b29c19672ffb6d1ffc5325be8b5c364df49eb7d4eecabc35040e8f00cdf0652015f171e512b4a94f00c8ed96978f47efb13c5dc9')

package() {
    npm install -g --cache npm-cache --omit dev --prefix "$pkgdir/usr" $pkgname-$pkgver.tgz
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /usr/lib/node_modules/$pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
