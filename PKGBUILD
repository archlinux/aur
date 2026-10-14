# Maintainer: PastLeo <chgu82837@gmail.com>
# Release-pinned binary recipe; generated updates follow published assets.
pkgname=ibus-misstype-bin
pkgver=0.5.5
pkgrel=1
pkgdesc='Offline, fuzzy Zhuyin input method for IBus (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/Yukaii/misstype'
license=('MIT' 'BSD-3-Clause' 'CC-BY-4.0' 'CC-BY-SA-4.0' 'Unicode-3.0')
depends=('ibus' 'gtk4' 'gcc-libs' 'glibc')
provides=("ibus-misstype=$pkgver")
conflicts=('ibus-misstype' 'ibus-misstype-git' 'fcitx5-misstype'
           'fcitx5-misstype-git' 'fcitx5-misstype-bin' 'fcitx5-mistype-git')
options=('!strip' '!debug')
source_x86_64=("$url/releases/download/v$pkgver/MisstypeIBus-$pkgver-arch-x86_64.pkg.tar.zst")
sha256sums_x86_64=('2e2778324c4282646bc690fcd5483686dff5fb64bc929e599959a82fc615c3c3')
source_aarch64=("$url/releases/download/v$pkgver/MisstypeIBus-$pkgver-arch-aarch64.pkg.tar.zst")
# Placeholder: prepare_aur_bin.py pins it, or drops aarch64 for releases without that asset.
sha256sums_aarch64=('8edab06b8ad17b31c54e8f1167d0811937fbf6310bec3a1e1a6fa23e132604ce')
noextract=("MisstypeIBus-$pkgver-arch-x86_64.pkg.tar.zst"
            "MisstypeIBus-$pkgver-arch-aarch64.pkg.tar.zst")

package() {
    bsdtar -xf "$srcdir/MisstypeIBus-$pkgver-arch-$CARCH.pkg.tar.zst" -C "$pkgdir" usr
    mv "$pkgdir/usr/share/licenses/ibus-misstype-git" "$pkgdir/usr/share/licenses/$pkgname"
}
