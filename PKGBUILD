# Maintainer: Térence Clastres <t.clastres@gmail.com>

pkgname=gnome-shell-extension-gtktitlebar-git
pkgver=2.0.r4.gda75129
pkgrel=2
pkgdesc="A GNOME Shell extension that GTK Title Bar - Remove Title Bar for non-GTK Software"
arch=('any')
url="https://github.com/velitasali/GTKTitleBar"
license=('GPL2')
depends=('gnome-shell>=3.28' 'xorg-xprop')
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
    cp -R "gtktitlebar@velitasali.github.io" "$pkgdir/usr/share/gnome-shell/extensions"
}
