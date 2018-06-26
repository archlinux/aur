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
provides=('archiso-offline-releng')
source=("https://aur.archlinux.org/cgit/aur.git/snapshot/archiso-offline-releng.tar.gz")
sha256sums=('SKIP')

prepare() {
    install -d -m755 "$pkgdir/usr/share/archiso/configs/offline_releng"
    cp -r /usr/share/archiso/configs/releng/* "$pkgdir/usr/share/archiso/configs/offline_releng/"
}

package() {
    cd $_name

    # Install main application
    install -d -m755 "$pkgdir/usr/share/archiso/configs/offline_releng"

    patch $pkgdir/usr/share/archiso/configs/offline_releng/build.sh < offline.patch
    #install -m755 build.sh            "$pkgdir/usr/share/archiso/configs/offline_releng/"
}

