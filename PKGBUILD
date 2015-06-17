# Contributor: Xappe & the_isz from archlinux.org forums

pkgname=xdm-arch-theme
pkgver=2.3.1
pkgrel=3
pkgdesc="An Arch Linux theme for xdm."
arch=("any")
url="https://github.com/the-isz/xdm-arch-theme"
license="GPL"
depends=("xorg-xdm" "xorg-xrandr" "xorg-xclock" "xorg-xwininfo" "xorg-xsetroot" "xorg-xkill" "librsvg")
makedepends=("tar" "gzip")
optdepends=(
    "xorg-xmessage: for reboot/halt buttons"
    "imagemagick: one option for setting the background image"
    "feh: another option for setting the background image"
    "xv: another option for setting the background image" )
source=(
    "https://github.com/the-isz/$pkgname/tarball/$pkgver"
    "http://upload.wikimedia.org/wikipedia/en/a/ac/Archlinux-official-fullcolour.svg" 
    )
md5sums=(
    "10d6a48c0cc80685273306aae7b9e03c"
    "abc1cc75e716e05a7405071d79dfdf8c"
    )
install=${pkgname}.install

package() {
    cd "$srcdir/the-isz-$pkgname-91ad422"

    install -g root -o root -d ${pkgdir}/etc/X11/xdm/arch-xdm
    install -g root -o root -p -m 644 arch-xdm/* ${pkgdir}/etc/X11/xdm/arch-xdm
    chmod u+x ${pkgdir}/etc/X11/xdm/arch-xdm/buttons
    install -g root -o root -p -m 644 ${srcdir}/Archlinux-official-fullcolour.svg ${pkgdir}/etc/X11/xdm/arch-xdm
}
