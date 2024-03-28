# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=joshuto-bin
pkgver=0.9.8
pkgrel=1
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
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/kamiyaa/joshuto/releases/download/v$pkgver/joshuto-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_arm=("$pkgname-$pkgver-arm.tar.gz::https://github.com/kamiyaa/joshuto/releases/download/v$pkgver/joshuto-v$pkgver-arm-unknown-linux-gnueabihf.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/kamiyaa/joshuto/releases/download/v$pkgver/joshuto-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
b2sums_x86_64=('8c8604397c23feb1a8b06d17a3a970803f9b8d5eca806bcb6c491fc8d4fa5d8e3b22f59f2f211f2a553a0a93469af27a3099e5e0603f07780c5d63289cab0203')
b2sums_arm=('b24c7c25253f532b3ea287c37dcaf5badad0a29ba0997f297806c7652e27a70329de0a10381fafd3e2b73c468537c79c245af0a5def7eaf418027fd7e7bb6c9a')
b2sums_aarch64=('c0fb9cd88b10143c0278803ca88431f7230fe9975aacd4b20e45be4403b1644cd2c91701646530a07897e320e6cd8f85537ac41db01fe08cdb2674edbb2533b9')

package() {
    case "$CARCH" in
    "x86_64")
        subfolder="joshuto-v$pkgver-$CARCH-unknown-linux-musl";;
    "aarch64")
        subfolder="joshuto-v$pkgver-$CARCH-unknown-linux-gnu";;
    "arm")
        subfolder="joshuto-v$pkgver-$CARCH-unknown-linux-gnueabihf";;
    esac
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$subfolder/joshuto"
}
