# Maintainer: PastLeo <chgu82837@gmail.com>
# Release-pinned binary recipe; generated updates follow published assets.
pkgname=fcitx5-misstype-bin
pkgver=0.4.3
pkgrel=1
pkgdesc='Offline, fuzzy Zhuyin input method for fcitx5 (prebuilt)'
arch=('x86_64')
url='https://github.com/Yukaii/misstype'
license=('MIT' 'BSD-3-Clause' 'CC-BY-4.0' 'CC-BY-SA-4.0' 'Unicode-3.0')
depends=('fcitx5' 'gcc-libs' 'glibc')
optdepends=('fcitx5-configtool: add Misstype to your input methods'
            'gtk4: misstype-dictionary-editor'
            'fcitx5-gtk: GTK application integration'
            'fcitx5-qt: Qt application integration')
provides=("fcitx5-misstype=$pkgver")
conflicts=('fcitx5-misstype' 'fcitx5-misstype-git' 'fcitx5-mistype-git'
           'ibus-misstype' 'ibus-misstype-git' 'ibus-misstype-bin')
options=('!strip' '!debug')
source=("$url/releases/download/v$pkgver/Misstype-$pkgver-arch-x86_64.pkg.tar.zst")
sha256sums=('2d041b61afc58dc7c59e0298f32b1d500e90dcf33f297037a471615b58e66d13')
noextract=("Misstype-$pkgver-arch-x86_64.pkg.tar.zst")

package() {
    # Only the payload, never the original pacman package metadata.
    bsdtar -xf "$srcdir/Misstype-$pkgver-arch-x86_64.pkg.tar.zst" -C "$pkgdir" usr
    mv "$pkgdir/usr/share/licenses/fcitx5-misstype-git" "$pkgdir/usr/share/licenses/$pkgname"
}
