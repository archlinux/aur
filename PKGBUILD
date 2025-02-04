# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname='c3-lsp'
pkgver='0.4.0'
pkgrel=1
pkgdesc='Language Server for the C3 language.'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/pherrymason/c3-lsp'

license=('GPL-3.0-only')
makedepends=('make' 'go')
depends=('glibc')

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/pherrymason/$pkgname/archive/refs/tags/v${pkgver}.tar.gz"
)

sha512sums=(
    '8257448114e9bfd9d497956f8b15437a69a41ea40e844f97998f4920ed8ebb47b68f8cc5964f6b6d11c80fbf51c4cc4633b1c272dc020a85699eca732d5e39bf'
)

build() {
    make build -C "$pkgname-$pkgver"
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/server/bin/c3lsp" "$pkgdir/usr/bin/c3lsp"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/c3lsp/LICENSE"
}
