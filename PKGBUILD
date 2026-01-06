# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=joshuto-bin
pkgver=0.9.9
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
b2sums_x86_64=('7e22620816a9c876380c0401d1d51736a9bf6fb4354f909b67e46c9a9087a9edcff694ebe25f6bbda1ccf4c7a5ab8fa9141ce8babfd8fac6566f19b3779bbd9f')
b2sums_arm=('464e5b95402fcc3e4d7cda201c8f69c04a244b87e06ad59e4510c72797d89156c6af414d50e08100e6f7e390b353e77dc151dbf69da536e04bc9f1e2ea2d6073')
b2sums_aarch64=('2cf92dc7395cc64ce2539065b5b035ffbb5ca172987b89ef3e73eeb5ee8797b70637e00689533775131485257daf1ee217b72fd4b9338b9d9cda66013ca1e891')

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
