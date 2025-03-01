# Maintainer: Jorge Arévalo Fernández <jorjai@jorjai.net>

pkgname=bonk-bin
pkgver=1.0.3
pkgrel=0
pkgdesc="A mighty command-line tool for bonking your friends, enemies, or inanimate objects! Keep track of exactly how many times you've bonked anything with persistent cloud-based bonking statistics."
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/KingJorjai/BONK"
license=('MIT')

source_x86_64=("https://github.com/KingJorjai/BONK/releases/download/v$pkgver/BONK_Linux_x86_64.tar.gz")
source_aarch64=("https://github.com/KingJorjai/BONK/releases/download/v$pkgver/BONK_Linux_arm64.tar.gz")
source_i686=("https://github.com/KingJorjai/BONK/releases/download/v$pkgver/BONK_Linux_i386.tar.gz")

sha256sums_x86_64=('7aa8ebe86b4da39fa77cffe94ed0ea3e11bb2cb4992dd4a061734cc08c2a3ba1')
sha256sums_aarch64=('4f2abaea508644cd30c2a2a79d35fdeb9aabe4142f185572d2a9e817c1c3ce74')
sha256sums_i686=('d75c02aa129ef075c43bf01d123a2e416944e15f21b3892ade95e882eca26f5b')

source=()

if [ "$CARCH" = "x86_64" ]; then
    source+=("$source_x86_64")
    sha256sums+=("${sha256sums_x86_64[@]}")
elif [ "$CARCH" = "aarch64" ]; then
    source+=("$source_aarch64")
    sha256sums+=("${sha256sums_aarch64[@]}")
elif [ "$CARCH" = "i686" ]; then
    source+=("$source_i686")
    sha256sums+=("${sha256sums_i686[@]}")
fi

package() {
    cd "$srcdir"
    tar -xvf "BONK_Linux_$CARCH.tar.gz"
    install -Dm755 "BONK" "$pkgdir/usr/bin/BONK"
}

# vim:set ts=2 sw=2 et: 
