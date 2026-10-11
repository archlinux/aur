# Maintainer: PastLeo <chgu82837@gmail.com>
# Release-pinned binary recipe; generated updates follow published assets.
pkgname=ibus-misstype-bin
pkgver=0.4.3
pkgrel=1
pkgdesc='Offline, fuzzy Zhuyin input method for IBus (prebuilt)'
arch=('x86_64')
url='https://github.com/Yukaii/misstype'
license=('MIT' 'BSD-3-Clause' 'CC-BY-4.0' 'CC-BY-SA-4.0' 'Unicode-3.0')
depends=('ibus' 'gtk4' 'gcc-libs' 'glibc')
provides=("ibus-misstype=$pkgver")
conflicts=('ibus-misstype' 'ibus-misstype-git' 'fcitx5-misstype'
           'fcitx5-misstype-git' 'fcitx5-misstype-bin' 'fcitx5-mistype-git')
options=('!strip' '!debug')
source=("$url/releases/download/v$pkgver/MisstypeIBus-$pkgver-arch-x86_64.pkg.tar.zst")
sha256sums=('b7e553507e2a1a814769cf3e73a153cf9cf1bc1e75d2c340bab1b8637b1d8348')
noextract=("MisstypeIBus-$pkgver-arch-x86_64.pkg.tar.zst")

package() {
    bsdtar -xf "$srcdir/MisstypeIBus-$pkgver-arch-x86_64.pkg.tar.zst" -C "$pkgdir" usr
    mv "$pkgdir/usr/share/licenses/ibus-misstype-git" "$pkgdir/usr/share/licenses/$pkgname"
}
