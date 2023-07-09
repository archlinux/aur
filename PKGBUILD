# Maintainer: Josh Meranda <joshmeranda@gmail.com>
pkgname=wrash
pkgver=0.2.4
pkgrel=1
depends=()
pkgdesc="A minimalistic command wrapper shell"
arch=(x86_64)
url="https://github.com/joshmeranda/wrash"
license=('MIT')
groups=()
makedepends=("go")
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=("$pkgname-$pkgver::https://github.com/joshmeranda/wrash/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make build
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make test
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
