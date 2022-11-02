# Maintainer: Librewish <librewish@gmail.com>

pkgname=samba-support
pkgver=1
pkgrel=7
arch=('any')
url="https://wiki.archlinux.org/index.php/samba"
license=('GPL')
pkgdesc="Metapkg and configuration for Samba support"
depends=("avahi"
        "nss-mdns"
        "samba"
        "python-pysmbc")
optdepends=('system-config-samba: The Samba configuration tool by Red Hat')
source=('smb.conf')
backup=('etc/samba/smb.conf')
sha256sums=('b63df445136b07a48fec4b363e1c3dca5894cf60162af8c0c1305656cd69dcfd')
install=$pkgname.install

package() {
    install -Dm644 smb.conf $pkgdir/etc/samba/smb.conf
    mkdir -p $pkgdir/var/lib/samba/usershare
    chmod 1770 $pkgdir/var/lib/samba/usershare
}
