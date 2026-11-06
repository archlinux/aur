# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkinitcpio-mercurio"
pkgver=1.1.1
pkgrel=1
pkgdesc="mkinitcpio hook that sends a notification through mercurio on each boot"
url="https://gitlab.archlinux.org/alphajack/mkinitcpio-mercurio"
license=("GPL-3.0-or-later")
arch=("any")
depends=("bash" "mkinitcpio" "mercurio")
optdepends=("mkinitcpio-systemd-extras: network connectivity (systemd initrd)"
            "mkinitcpio-netconf: network connectivity (busybox initrd)")
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
b2sums=('839aab28d566e27e5301b82447385f9ee6a53ac183f09a8f65a43239f1a27801bd05f1c539dbad9b227da681355e3d91ad55d5f1756fb53ecf7dace48fad15d7')
backup=("etc/mercurio/initcpio.conf")
install="$pkgname.install"

package(){
 cd "$pkgname-v$pkgver"
 install -D -m 600 "mercurio_config" "$pkgdir/etc/mercurio/initcpio.conf"
 install -D -m 644 "mercurio_hook" "$pkgdir/usr/lib/initcpio/hooks/mercurio"
 install -D -m 644 "mercurio_install" "$pkgdir/usr/lib/initcpio/install/mercurio"
 install -D -m 644 "mercurio_alpm_hook" "$pkgdir/usr/share/libalpm/hooks/mkinitcpio-mercurio.hook"
 install -D -m 755 "mercurio_alpm_script" "$pkgdir/usr/share/libalpm/scripts/mkinitcpio-mercurio"
}
