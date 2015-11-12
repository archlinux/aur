# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=mpv-plugin-xrandr
pkgver=r312074b
pkgrel=5
pkgdesc="Makes mpv automatically invoke the "xrandr" tool to set the best suitable parameters for the display output"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/lvml/mpv-plugin-xrandr"
depends=('mpv' 'xorg-xrandr' 'bash')
source=('git+https://github.com/lvml/mpv-plugin-xrandr' 'mpv.sh' 'default_screen.conf')
backup=('etc/mpv-plugin-xrandr/default_screen.conf')
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package () {
    install -Dm755 mpv.sh "$pkgdir/usr/bin/mpv.sh"
    install -Dm755 "$srcdir/$pkgname/xrandr.lua" "$pkgdir/etc/$pkgname/xrandr.lua"
    install -Dm644 default_screen.conf "$pkgdir/etc/$pkgname/default_screen.conf"
    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 "$srcdir/$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README"
}