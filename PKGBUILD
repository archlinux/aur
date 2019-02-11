# Maintainer: Térence Clastres <t.clastres@gmail.com>
# Maintainer: Samuel Bachmann aka samuelba <samuel.bachmann@gmail.com>

pkgname=gnome-shell-extension-ping-monitor-applet-git
pkgver=0.0.12.r1.ga9e15be
pkgrel=1
pkgdesc="Ping monitor extension for Gnome-Shell"
arch=('any')
url="http://github.com/anybotics/gnome-shell-ping-monitor-applet"
license=('GPL3')
depends=('gnome-shell>=3.3.90' 'libgtop' 'networkmanager')
makedepends=('git')
provides=("${pkgname/-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$pkgname"
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
    cp -R "ping-monitor@samuel.bachmann.gmail.com" "$pkgdir/usr/share/gnome-shell/extensions"
}
