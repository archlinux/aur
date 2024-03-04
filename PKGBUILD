# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkinitcpio-zerotier"
pkgver=1.1
pkgrel=1
pkgdesc="mkinitcpio hook that initialises ZeroTier One to assist in the remote unlocking of encrypted partitions"
url="https://gitlab.archlinux.org/alphajack/mkinitcpio-zerotier"
license=("GPL3")
arch=("any")
depends=("mkinitcpio" "mkinitcpio-utils" "zerotier-one")
optdepends=("mkinitcpio-tinyssh: SSH server (busybox initrd)"
            "mkinitcpio-dropbear: SSH server (busybox initrd)"
            "mkinitcpio-netconf: network connectivity (busybox initrd)"
            "mkinitcpio-systemd-extras: network connectiviy and SSH server (systemd initrd)")
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
b2sums=('9043f056997739dc3b6d709df52d7043dc2aa97a64606ecca4bc5f1d1a2f4f49f983d29be1db381ba823236d8dfc42c2dfb7a4f9daf5e87e29b7987fc3ab2beb')
backup=("var/lib/zerotier-one/initcpio/config.ini")
install="$pkgname.install"

package(){
 cd "$pkgname-v$pkgver"
 install -D -m 644 "zerotier_config" "$pkgdir/var/lib/zerotier-one/initcpio/config.ini"
 install -D -m 644 "zerotier_hook" "$pkgdir/usr/lib/initcpio/hooks/zerotier"
 install -D -m 644 "zerotier_install" "$pkgdir/usr/lib/initcpio/install/zerotier"
}
