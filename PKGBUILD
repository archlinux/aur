# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkinitcpio-mercurio"
pkgver=1.1.0
pkgrel=1
pkgdesc="mkinitcpio hook that sends a notification through mercurio on each boot"
url="https://gitlab.archlinux.org/alphajack/mkinitcpio-mercurio"
license=("GPL-3.0-or-later")
arch=("any")
depends=("bash" "mkinitcpio" "mercurio")
optdepends=("mkinitcpio-systemd-extras: network connectivity (systemd initrd)"
            "mkinitcpio-netconf: network connectivity (busybox initrd)")
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
b2sums=('e280386baee2b4b2c2188dd996910d8a6b64af8bd938e33eae8931ff29da626ad5af81c8db06dd39caf0b1a9e90ea47e9fc573dd8bf347c499cf1a6defbd84bb')
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
