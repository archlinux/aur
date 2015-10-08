# Maintainer: Bhushan Shah <bshah@kde.org>
# Maintainer: AnAkkk <anakin.cs@gmail.com>
pkgname=plasma-workspace-units-git
pkgver=0.01
pkgrel=2
arch=("any")
pkgdesc="systemd user-session units for KDE Frameworks 5 and Plasma 5"
url="https://github.com/eliasp/plasma-workspace-units"
license=('GPL')
depends=('plasma-desktop')
conflicts=()
source=("git://github.com/eliasp/plasma-workspace-units.git")
md5sums=("SKIP") 

prepare() {
    cd plasma-workspace-units
    sed 's:\/usr\/local:\/usr:' -i systemd.desktop
}

package() {
    cd plasma-workspace-units
    install -Dm644 systemd.desktop ${pkgdir}/usr/share/xsessions/systemd.desktop
    install -Dm755 startsystemd ${pkgdir}/usr/bin/startsystemd
    install -Dm644 systemd/user/* -t ${pkgdir}/usr/lib/systemd/user/
    install -Dm644 dbus/services/* -t ${pkgdir}/usr/share/dbus-1/services/
}
