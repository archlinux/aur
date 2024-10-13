# Maintainer: Fred Mitchell <fred.mitchell@atomlogik.de>
pkgname=swiss-army-knife-hs
pkgver=0.0.0.2
pkgrel=1
pkgdesc="A collection of powerful but useful small tools."
arch=('x86_64')
url="https://github.com/flajann2/swiss-army-knife-hs"
license=('MIT')
depends=('ghc' 'stack')
makedepends=('git')
source=("$pkgname::git+https://github.com/flajann2/swiss-army-knife-hs.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    stack build --system-ghc --ghc-options="-O3"
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 $(find . -path "*/install/*" -name sak -type f) "$pkgdir/usr/bin/sak"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
