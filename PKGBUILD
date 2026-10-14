# Maintainer: PastLeo <chgu82837@gmail.com>
# Release-pinned binary recipe; generated updates follow published assets.
pkgname=ibus-misstype-bin
pkgver=0.5.4
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
sha256sums_x86_64=('749eb6d8fb19f2fa4e1fe99b6f9c1abd92d0799f787768f490094398a4501219')
source_aarch64=("$url/releases/download/v$pkgver/MisstypeIBus-$pkgver-arch-aarch64.pkg.tar.zst")
# Placeholder: prepare_aur_bin.py pins it, or drops aarch64 for releases without that asset.
sha256sums_aarch64=('5482dd67d0ea2ef54cc322109602cf237adb354cbffb1875a3e76e3b30c3cc36')
noextract=("MisstypeIBus-$pkgver-arch-x86_64.pkg.tar.zst"
            "MisstypeIBus-$pkgver-arch-aarch64.pkg.tar.zst")

package() {
    bsdtar -xf "$srcdir/MisstypeIBus-$pkgver-arch-$CARCH.pkg.tar.zst" -C "$pkgdir" usr
    mv "$pkgdir/usr/share/licenses/ibus-misstype-git" "$pkgdir/usr/share/licenses/$pkgname"
}
