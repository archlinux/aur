# Maintainer: PastLeo <chgu82837@gmail.com>
# Release-pinned binary recipe; generated updates follow published assets.
pkgname=fcitx5-misstype-bin
pkgver=0.5.4
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
sha256sums_x86_64=('d67b8299bca98af381a8caaeb18218827510b647169b323b3e03c370d56692fb')
source_aarch64=("$url/releases/download/v$pkgver/Misstype-$pkgver-arch-aarch64.pkg.tar.zst")
# Placeholder: prepare_aur_bin.py pins it, or drops aarch64 for releases without that asset.
sha256sums_aarch64=('f296f522df3277f0aaba957bed9b8f5b568feec27b4517ded8eb057936fe3919')
noextract=("Misstype-$pkgver-arch-x86_64.pkg.tar.zst"
            "Misstype-$pkgver-arch-aarch64.pkg.tar.zst")

package() {
    # Only the payload, never the original pacman package metadata.
    bsdtar -xf "$srcdir/Misstype-$pkgver-arch-$CARCH.pkg.tar.zst" -C "$pkgdir" usr
    mv "$pkgdir/usr/share/licenses/fcitx5-misstype-git" "$pkgdir/usr/share/licenses/$pkgname"
}
