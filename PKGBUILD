# Maintainer: Student Wei <studentweis@gmail.com>
pkgname=ropy-bin
pkgver=0.7.2
pkgrel=1
pkgdesc='A clipboard manager built with Rust and GPUI (prebuilt binary)'
arch=('x86_64')
url='https://github.com/StudentWeis/ropy'
license=('MIT')
depends=('glibc' 'gcc-libs' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'libglvnd' 'wayland')
optdepends=('xdg-desktop-portal: desktop-approved global shortcuts (requires a compatible backend)')
provides=("ropy=$pkgver")
conflicts=('ropy')
options=('!strip' '!debug')
source=("ropy-$pkgver.png::$url/raw/refs/tags/$pkgver/assets/logo.png"
        'ropy.desktop')
source_x86_64=("ropy-$pkgver-x86_64.tar.xz::$url/releases/download/$pkgver/ropy-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('b168d3d148545cecfcee795741048d2296f066ea48a03f064d6e0a6e159ab06f'
            '4246519d23a0b2b6399674d56690ed6b703f5f03671b31463441ebe63caa27ec')
sha256sums_x86_64=('fe1ab08627f480c1321ec9408eae19522885f6bfdccb1222e79dfc31c73ce657')

package() {
    local release_dir="$srcdir/ropy-$CARCH-unknown-linux-gnu"
    install -Dm755 "$release_dir/ropy" "$pkgdir/usr/bin/ropy"
    install -Dm644 "$release_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/ropy.desktop" "$pkgdir/usr/share/applications/ropy.desktop"
    install -Dm644 "$srcdir/ropy-$pkgver.png" "$pkgdir/usr/share/pixmaps/ropy.png"
}
