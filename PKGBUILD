# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname='c3-lsp'
pkgver='0.3.3'
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
    'd199317859e16c3c63e3b7e142fa7d86495e1b9cb2937a2ab2a4c29427cfd87fda1ee834af35525f9ceb4e8c332671791b83b24201fbc0efb2faa8afbc287edb'
)

build() {
    make build -C "$pkgname-$pkgver"
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/server/bin/c3lsp" "$pkgdir/usr/bin/c3lsp"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/c3lsp/LICENSE"
}
