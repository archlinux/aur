# Maintainer: Yves Motteux <yvesmotteux@gmail.com>
pkgname=ficflow-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="Track and organize your fanfiction reading list"
arch=('x86_64')
url="https://github.com/yvesmotteux/Ficflow"
license=('GPL-3.0-or-later')
provides=('ficflow')
conflicts=('ficflow')
depends=(
    'glibc'
    'gcc-libs'
    'libxkbcommon'
    'vulkan-icd-loader'
    'fontconfig'
)
source=(
    "ficflow-$pkgver::$url/releases/download/v$pkgver/ficflow-linux-amd64"
    "ficflow-icon-$pkgver.png::$url/raw/v$pkgver/assets/icon.png"
    "LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE"
    "ficflow.desktop"
)
sha256sums=('0c0aa2441e2cef1de3810cdcdabc829cc86e3a78c040ed86a91614ca085847a7'
            'dd43ed1ab15872dc0176283c90316eb5cdcff4c207194578d14cb45a97d1ab3f'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '6b208aae52b09a4716c788d1aa5d43addc8ff9b55154df459cf9f96f601e6835')

package() {
    install -Dm755 "$srcdir/ficflow-$pkgver"      "$pkgdir/usr/bin/ficflow"
    install -Dm644 "$srcdir/ficflow.desktop"      "$pkgdir/usr/share/applications/ficflow.desktop"
    install -Dm644 "$srcdir/ficflow-icon-$pkgver.png" "$pkgdir/usr/share/pixmaps/ficflow.png"
    install -Dm644 "$srcdir/LICENSE-$pkgver"      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
