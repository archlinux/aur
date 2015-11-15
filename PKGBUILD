# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=mpv-plugin-xrandr
pkgver=r312074b
pkgrel=7
pkgdesc="Makes mpv automatically invoke the "xrandr" tool to set the best suitable parameters for the display output"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/lvml/mpv-plugin-xrandr"
depends=('mpv' 'xorg-xrandr' 'bash')
source=('git+https://github.com/lvml/mpv-plugin-xrandr' 'mpv-xrandr.desktop')
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package () {
    install -Dm755 "$srcdir/$pkgname/xrandr.lua" "$pkgdir/etc/$pkgname/xrandr.lua"
    install -Dm644 mpv-xrandr.desktop "$pkgdir/usr/share/applications/mpv-xrandr.desktop"
    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 "$srcdir/$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README"
}