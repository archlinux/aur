# Maintainer: Librewish <librewish@gmail.com>

pkgname=samba-support
pkgver=1
pkgrel=2
arch=('any')
url="https://wiki.archlinux.org/index.php/samba"
license=('GPL')
pkgdesc="Meta package for samba support."
depends=("samba" "avahi" "nss-mdns")
optdepends=('system-config-samba: The Samba configuration tool by Red Hat')
provides=("garuda-settings-samba" "garuda-samba")
conflicts=("garuda-settings-samba")
replaces=("garuda-settings-samba" "manjaro-settings-samba" "garuda-samba")
install=samba.install
source=('smb.conf')
md5sums=('6f594384fdd50e1a88653382fcedb12e')
package() {
        install -Dm644 smb.conf $pkgdir/etc/samba/smb.conf
        mkdir -p $pkgdir/var/lib/samba/usershare
        chmod 1770 $pkgdir/var/lib/samba/usershare
}
