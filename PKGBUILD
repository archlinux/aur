# Maintainer: JOLIMAITRE Matthieu <matthieu@imagevo.fr>
pkgname="reflex-3-3"
pkgver=1.0.3
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
    install -Dm 755 "lib/libreflex.so" "$pkgdir/usr/lib/libreflex.so"
    install -Dm 755 "lib/libreflex.so" "$pkgdir/usr/lib/libreflexmin.so"
    cd "include/reflex"
    install -Dm 644 "abslexer.h" "$pkgdir/usr/include/reflex/abslexer.h"
    install -Dm 644 "absmatcher.h" "$pkgdir/usr/include/reflex/absmatcher.h"
    install -Dm 644 "bits.h" "$pkgdir/usr/include/reflex/bits.h"
    install -Dm 644 "boostmatcher.h" "$pkgdir/usr/include/reflex/boostmatcher.h"
    install -Dm 644 "convert.h" "$pkgdir/usr/include/reflex/convert.h"
    install -Dm 644 "debug.h" "$pkgdir/usr/include/reflex/debug.h"
    install -Dm 644 "error.h" "$pkgdir/usr/include/reflex/error.h"
    install -Dm 644 "flexlexer.h" "$pkgdir/usr/include/reflex/flexlexer.h"
    install -Dm 644 "input.h" "$pkgdir/usr/include/reflex/input.h"
    install -Dm 644 "matcher.h" "$pkgdir/usr/include/reflex/matcher.h"
    install -Dm 644 "pattern.h" "$pkgdir/usr/include/reflex/pattern.h"
    install -Dm 644 "pcre2matcher.h" "$pkgdir/usr/include/reflex/pcre2matcher.h"
    install -Dm 644 "posix.h" "$pkgdir/usr/include/reflex/posix.h"
    install -Dm 644 "ranges.h" "$pkgdir/usr/include/reflex/ranges.h"
    install -Dm 644 "setop.h" "$pkgdir/usr/include/reflex/setop.h"
    install -Dm 644 "simd.h" "$pkgdir/usr/include/reflex/simd.h"
    install -Dm 644 "stdmatcher.h" "$pkgdir/usr/include/reflex/stdmatcher.h"
    install -Dm 644 "timer.h" "$pkgdir/usr/include/reflex/timer.h"
    install -Dm 644 "traits.h" "$pkgdir/usr/include/reflex/traits.h"
    install -Dm 644 "unicode.h" "$pkgdir/usr/include/reflex/unicode.h"
    install -Dm 644 "utf8.h" "$pkgdir/usr/include/reflex/utf8.h"
}
