# Maintainer: Tea <icepie dot dev at gmail dot com>

pkgname=protoc-gen-ts
pkgver=0.8.2
pkgrel=1
pkgdesc='Aim of this protoc plugin is to make usage of protocol buffers easy in Javascript/Typescript by taking modern approaches.'
arch=('any')
url='https://github.com/thesayyn/protoc-gen-ts'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("${source[@]%%::*}")
sha256sums=('f25924f55265fcd96f6c97ff75dbfe7327414a9218cb1e2e406f752669beaefa')

PURGE_TARGETS=('*.1')

package() {
    npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$pkgname-$pkgver.tgz"
    chown -R root:root "$pkgdir/"
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "/usr/lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
