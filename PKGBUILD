# Maintainer: PastLeo <chgu82837@gmail.com>
# Release-pinned binary recipe; generated updates follow published assets.
pkgname=fcitx5-misstype-bin
pkgver=0.5.9
pkgrel=1
pkgdesc='Offline, fuzzy Zhuyin input method for fcitx5 (prebuilt)'
arch=('x86_64' 'aarch64')
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
source_x86_64=("$url/releases/download/v$pkgver/Misstype-$pkgver-arch-x86_64.pkg.tar.zst")
sha256sums_x86_64=('e53a5f1c5c0db66b04d6543c1ba734baf3649487eb9170b78598dfffb868af7b')
source_aarch64=("$url/releases/download/v$pkgver/Misstype-$pkgver-arch-aarch64.pkg.tar.zst")
# Placeholder: prepare_aur_bin.py pins it, or drops aarch64 for releases without that asset.
sha256sums_aarch64=('5c046c902e5711db8aeed78337e4798726edbe885951c9d3e8c7a9b3f20a9f2a')
noextract=("Misstype-$pkgver-arch-x86_64.pkg.tar.zst"
            "Misstype-$pkgver-arch-aarch64.pkg.tar.zst")

package() {
    # Only the payload, never the original pacman package metadata.
    bsdtar -xf "$srcdir/Misstype-$pkgver-arch-$CARCH.pkg.tar.zst" -C "$pkgdir" usr
    mv "$pkgdir/usr/share/licenses/fcitx5-misstype-git" "$pkgdir/usr/share/licenses/$pkgname"
}
