# Maintainer: Librewish <librewish@gmail.com>

pkgname=samba-support
pkgver=1
pkgrel=6
arch=('any')
url="https://wiki.archlinux.org/index.php/samba"
license=('GPL')
pkgdesc="Metapkg and configuration for Samba support"
depends=("avahi"
        "nss-mdns"
        "samba"
        "python-pysmbc")
optdepends=('system-config-samba: The Samba configuration tool by Red Hat')
replaces=('manjaro-settings-samba')
source=('smb.conf')
backup=('etc/samba/smb.conf')
md5sums=('6f594384fdd50e1a88653382fcedb12e')
install=$pkgname.install

package() {
    install -Dm644 smb.conf $pkgdir/etc/samba/smb.conf
    mkdir -p $pkgdir/var/lib/samba/usershare
    chmod 1770 $pkgdir/var/lib/samba/usershare
}
