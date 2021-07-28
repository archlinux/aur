# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkinitcpio-zerotier"
pkgver=1.0
pkgrel=1
pkgdesc="mkinitcpio hook that initialises ZeroTier One to assist in the remote unlocking of encrypted partitions"
url="https://github.com/AlphaJack/mkinitcpio-zerotier"
license=("GPL3")
arch=("any")
depends=("mkinitcpio" "mkinitcpio-netconf" "mkinitcpio-utils" "zerotier-one")
optdepends=("mkinitcpio-tinyssh: SSH server" "mkinitcpio-dropbear: SSH server")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("11b2c1d9826e107433798c311475f9af9fed08a1402508233d4ef74e60e0b73b")
backup=("var/lib/zerotier-one/initcpio/config.ini")
install="$pkgname.install"

package(){
 cd "$pkgname-$pkgver"
 install -D -m 644 "zerotier_config" "$pkgdir/var/lib/zerotier-one/initcpio/config.ini"
 install -D -m 644 "zerotier_hook" "$pkgdir/usr/lib/initcpio/hooks/zerotier"
 install -D -m 644 "zerotier_install" "$pkgdir/usr/lib/initcpio/install/zerotier"
}
