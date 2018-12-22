# Maintainer: Pedro Henrique <pedro00dk@gmail.com>
pkgname=overgrive
pkgver=3.2.3
pkgrel=1
pkgdesc="OverGrive without any extra stuff required in 
https://www.thefanclub.co.za/overgrive/installation-instructions-arch-linux"
arch=('x86_64')
url="https://www.thefanclub.co.za/overgrive"
license=("unknown")
depends=(
    libnotify libappindicator-gtk3 python2 python2-pyinotify python2-gobject python2-virtualenv
)
provides=("overgrive")
conflicts=("overgrive")
install="overgrive.install"
changelog=
source=(
    "https://www.thefanclub.co.za/sites/default/files/public/overgrive/overgrive-3.2.3-0-any.pkg.tar.xz"
)
noextract=("overgrive-3.2.3-0-any.pkg.tar.xz")
md5sums=("6d7cc554e39b6ea399ff88358a58eb78")
prepare() {
    tar --extract --file='./overgrive-3.2.3-0-any.pkg.tar.xz'
    rm -- './overgrive-3.2.3-0-any.pkg.tar.xz'
    sed --in-place -- \
        's+Exec=python2+Exec=/opt/thefanclub/overgrive/venv/bin/python2+g' \
        './usr/share/applications/overgrive.desktop'
}
package() {
    cp --recursive -- './opt/' './usr/' "${pkgdir}/"
}
