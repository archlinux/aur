# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=joshuto-bin
pkgver=0.9.6
pkgrel=2
pkgdesc="ranger-like terminal file manager written in Rust"
url="https://github.com/kamiyaa/joshuto"
license=("LGPL3")
arch=("x86_64" "arm" "aarch64")
depends=("gcc-libs")
optdepends=(
    'xclip: X11 clipboard support'
    'wl-clipboard: Wayland clipboard support'
    'fzf: fuzzy finder support'
    'zoxide: zoxide support'
)
provides=("joshuto")
conflicts=("joshuto" "joshuto-git")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/kamiyaa/joshuto/releases/download/v$pkgver/joshuto-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_arm=("$pkgname-$pkgver-arm.tar.gz::https://github.com/kamiyaa/joshuto/releases/download/v$pkgver/joshuto-v$pkgver-arm-unknown-linux-gnueabihf.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/kamiyaa/joshuto/releases/download/v$pkgver/joshuto-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
b2sums_x86_64=('78f18c3c5025689a261ad09e3cf6ad361e7c72d426884bdf59088c63ccc8d08d0925511611bf7f829bf9aaa97470d0634f7a9a848fabc64d51d39559326d4d26')
b2sums_arm=('926caff3f1679228717ceab75311746b77e19eee743b206e435f9ccfca7b3eee2be963af1f852e0484384d3bc656585ec00bc0c14476009eddf5a6788e1358ae')
b2sums_aarch64=('3e797de89aace25e431ccd020901a28ac2bd25e7785efbd2450406ae9a842f91fc1a6dc07703942caa4d32e8f47f229a44f555ca124d9d259e81fb91155c1d25')

package() {
    case "$CARCH" in
    "x86_64" | "aarch64")
        subfolder="joshuto-v$pkgver-$CARCH-unknown-linux-gnu";;
    "arm")
        subfolder="joshuto-v$pkgver-$CARCH-unknown-linux-gnueabihf";;
    esac
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$subfolder/joshuto"
}
