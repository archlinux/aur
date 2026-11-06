# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkinitcpio-mercurio"
pkgver=1.0.0
pkgrel=1
pkgdesc="mkinitcpio hook that sends a notification through mercurio on each boot"
url="https://gitlab.archlinux.org/alphajack/mkinitcpio-mercurio"
license=("GPL-3.0-or-later")
arch=("any")
depends=("bash" "mkinitcpio" "mercurio")
optdepends=("mkinitcpio-systemd-extras: network connectivity (systemd initrd)"
            "mkinitcpio-netconf: network connectivity (busybox initrd)")
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
b2sums=('dd8a11c913af00d82dd0ff30f1ff69eb17a9c2758b61f9d783977386eed30fa763c5104cad34b08d26d2da7011bd78dce4214b7a2ab1af0e1cf273a12c0bd577')
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
