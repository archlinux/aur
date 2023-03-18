# Maintainer: JOLIMAITRE Matthieu <matthieu@imagevo.fr>
pkgname="reflex-3-3"
pkgver=1.0.1
pkgrel=1
pkgdesc="Fork of re/flex v3.3 (The regex-centric, fast lexical analyzer generator for C++) intended for use in EPITA school project TIGER."
url="https://github.com/MajorBarnulf/RE-flex"
arch=("x86_64")
license=("BSD 3-Clause")
makedepends=()
optdepends=()
depends=('gcc' 'git')
# source=("https://github.com/MajorBarnulf/RE-flex/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
source=("https://github.com/MajorBarnulf/RE-flex/releases/download/v1.0.0/$pkgname-1.0.0.tar.gz")
sha256sums=("781fe51d232f881ce97d0547bf57508c7620a2cf1b9e1fdf63c976c2181df701")

build() {
    cd "$srcdir"
    ./clean.sh
    ./build.sh
}

package() {
    cd "$srcdir"
    install -Dm 755 "bin/reflex" "$pkgdir/usr/bin/reflex"
    cd "include/reflex"
    for file in *.h; do
        install -Dm 644 "$file" "$pkgdir/usr/include/reflex/$file"
    done
}
