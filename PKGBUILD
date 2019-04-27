# Maintainer: saren@wtako.net
pkgname=pulseaudio-bt-auto-enable-a2dp
pkgver=19
pkgrel=1
pkgdesc="Udev service for temporary solve bug 92102 https://bugs.freedesktop.org/show_bug.cgi?id=92102"
url="https://gist.github.com/EHfive/c4f1218a75f95b076f0387403246de78"
arch=(any)
license=('unknown')
depends=('bluez-tools' 'expect' 'perl')
source=('20-bt-auto-enable-a2dp.rules' 'bt-auto-enable-a2dp')
sha256sums=('14a13177e3012f364d99264417c6792637e20e28a21ac03e697f5c2708e64f15' 'e37a779389144294fd42d7dcb97d825763e5abde8c1e93c189aa3b38bb65e006')
 
package() {
	user=$(basename $HOME)
	echo "Installing for $user"
	install -o $user -Dm0755 "$srcdir/bt-auto-enable-a2dp" "$pkgdir/usr/local/bin/bt-auto-enable-a2dp"
	install -Dm0644 "$srcdir/20-bt-auto-enable-a2dp.rules" "$pkgdir/etc/udev/rules.d/20-bt-auto-enable-a2dp.rules"
}

