# Maintainer: Yubo Cao <cao2006721@gmail.com>

pkgname=flectar-mail-bin
_pkgname=flectar-mail
pkgver=0.1.0alpha.6
_tagver=${pkgver/alpha/-alpha}
pkgrel=1
pkgdesc='Native email client built with Rust and Slint'
arch=('x86_64')
url='https://github.com/flectar/mail'
license=('AGPL-3.0-only')
depends=('fontconfig' 'fuse3' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libgpg-error'
         'libx11' 'libxcursor' 'libxi' 'libxkbcommon' 'libxkbcommon-x11' 'wayland'
         'xdg-utils')
optdepends=('org.freedesktop.secrets: storing account credentials'
            'gnupg: OpenPGP signing and encryption'
            'xdg-desktop-portal: native file dialogs')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
_raw=https://raw.githubusercontent.com/flectar/mail/v$_tagver
source=("$_pkgname-$pkgver.AppImage::$url/releases/download/v$_tagver/$_pkgname-$_tagver-linux-x64.AppImage"
        "com.flectar.mail-$pkgver.desktop::$_raw/resources/com.flectar.mail.desktop"
        "com.flectar.mail-$pkgver.svg::$_raw/resources/app-icon/flectar-mail-masked.svg")
sha256sums=('b7f0f02873c0e85af3822e4de9703727a1af00210e50271ae4dcfd567e5de663'
            'bd4f2020a71f42eacbd6fdd33f1e35d04547bf8e3cbef1574c2f7dde7de2044b'
            'f0e0083d21e8648d367a47e61d762c7ffd84e27d857749a38b499b2cd47341cf')

package() {
    install -Dm755 "$_pkgname-$pkgver.AppImage" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "com.flectar.mail-$pkgver.desktop" \
        "$pkgdir/usr/share/applications/com.flectar.mail.desktop"
    install -Dm644 "com.flectar.mail-$pkgver.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.flectar.mail.svg"
}
