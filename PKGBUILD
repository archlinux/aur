# Maintainer: Anton Hvornum <anton.feeds+AUR@gmail.com>
# makepkg --printsrcinfo > .SRCINFO
_owner=Torxed
_name=archiso-offline-releng
pkgname=$_name
pkgver=0.0.1.r1
pkgrel=1
pkgdesc="A simple, offline-installable modification on archiso/releng"
arch=('x86_64')
url="https://github.com/Torxed"
license=('custom:BSD' 'cc-by-nc-sa-3.0')
depends=('archiso' 'pacman' 'wget' 'tar')
#makedepends=('')
#optdepends=('')
provides=('archiso-offline-releng')
#conflicts=('')
source=("https://aur.archlinux.org/cgit/aur.git/snapshot/archiso-offline-releng.tar.gz")
sha256sums=('SKIP')

#pkgver() {
#    cd $_name
#    r=$(git log --pretty=oneline | cut -d' ' -f1 | wc -l)
#    h=$(git rev-parse --short HEAD)
#    printf v0.1.2.r$r.g$h
#}

prepare() {
    mkdir -p /usr/share/archiso/configs/offline_releng
    cp -r /usr/share/archiso/configs/releng/* /usr/share/archiso/configs/offline_releng/
}

#build() {
#    Nothing to build
#}

package() {
    cd $_name

    # Install main application
    #install -d -m755 "$pkgdir/usr/share/archiso/offline_releng"

    install -m755 build.sh            "$pkgdir/usr/share/archiso/offline_releng/"
}
