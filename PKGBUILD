# Maintainer: Jorge Arévalo Fernández <jorjai@jorjai.net>

pkgname=bonk-bin
pkgver=1.1.0
pkgrel=0
pkgdesc="A mighty command-line tool for bonking your friends, enemies, or inanimate objects! Keep track of exactly how many times you've bonked anything with persistent cloud-based bonking statistics."
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/KingJorjai/BONK"
license=('MIT')

source_x86_64=("https://github.com/KingJorjai/BONK/releases/download/v$pkgver/BONK_Linux_x86_64.tar.gz")
source_aarch64=("https://github.com/KingJorjai/BONK/releases/download/v$pkgver/BONK_Linux_arm64.tar.gz")
source_i686=("https://github.com/KingJorjai/BONK/releases/download/v$pkgver/BONK_Linux_i386.tar.gz")

sha256sums_x86_64=('fb45f148d74dd25f21e3349dc0afc24497b42480df3ed3fe6d7c9e33547512dd')
sha256sums_aarch64=('afd01c163450f7862db81ec523dd82b8bf920ed66a8fc13f99ae3a81b29158a3')
sha256sums_i686=('b48c371a19893d826660798c92b53a7d4508d4d2143aecace036aa0b55a499f6')

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
