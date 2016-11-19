# Maintainer: Yadav Gowda <yadav . gowda __at__ gmail . com>
pkgname=gnome-flashback-xmonad
pkgver=r18.5ea1599
pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=2
pkgdesc="XMonad support for Gnome Flashback"
arch=('any')
url="https://github.com/tlonic/gnome-flashback-xmonad"
license=('GPL')
depends=('haskell-xmonad' 'gnome-flashback' 'compton')
source=('gnome-flashback-xmonad::git+https://github.com/tlonic/gnome-flashback-xmonad.git')
md5sums=('SKIP')

package() {
    cd "$srcdir/${pkgname%-git}"
    mkdir -p "$pkgdir/usr/share/xsessions"
    mkdir -p "$pkgdir/usr/lib/gnome-flashback"
    mkdir -p "$pkgdir/usr/share/gnome-session/sessions"
    mkdir -p "$pkgdir/usr/share/applications"
    cp "xmonad.desktop" "$pkgdir/usr/share/applications/xmonad.desktop"
    cp "gnome-flashback-xmonad.desktop" "$pkgdir/usr/share/xsessions/"
    cp "gnome-flashback-xmonad.session" "$pkgdir/usr/share/gnome-session/sessions/"
    cp "gnome-flashback-xmonad" "$pkgdir/usr/lib/gnome-flashback/"
}
