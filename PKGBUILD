# Maintainer: PastLeo <chgu82837@gmail.com>
# Release-pinned binary recipe; generated updates follow published assets.
pkgname=fcitx5-misstype-bin
pkgver=0.5.6
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
sha256sums_x86_64=('72a1e83f4a78abaee1428e7afe4547dfc23073f1ebc65ea9e5dcfbcfdb2943ed')
source_aarch64=("$url/releases/download/v$pkgver/Misstype-$pkgver-arch-aarch64.pkg.tar.zst")
# Placeholder: prepare_aur_bin.py pins it, or drops aarch64 for releases without that asset.
sha256sums_aarch64=('ba0ad84b09e18aee1579fa147f5c39c7a8e8bf39736736cae36744ad2352bfba')
noextract=("Misstype-$pkgver-arch-x86_64.pkg.tar.zst"
            "Misstype-$pkgver-arch-aarch64.pkg.tar.zst")

package() {
    # Only the payload, never the original pacman package metadata.
    bsdtar -xf "$srcdir/Misstype-$pkgver-arch-$CARCH.pkg.tar.zst" -C "$pkgdir" usr
    mv "$pkgdir/usr/share/licenses/fcitx5-misstype-git" "$pkgdir/usr/share/licenses/$pkgname"
}
