# Maintainer: saren@wtako.net
pkgname=pulseaudio-bt-auto-enable-a2dp
pkgver=15
pkgrel=2
pkgdesc="Udev service for temporary solve bug 92102 https://bugs.freedesktop.org/show_bug.cgi?id=92102"
url="https://gist.github.com/EHfive/c4f1218a75f95b076f0387403246de78"
arch=(any)
license=('unknown')
depends=('bluez-tools' 'expect' 'perl')
source=('20-bt-auto-enable-a2dp.rules' 'bt-auto-enable-a2dp')
sha256sums=('2a7cf2b8570e75cabdc39ea50f6f9b49977e27bb75a48be9fb68a0af15cc0db5' 'e36a9247bc3dd72899cc5a6ed12bbc4721f0472449acf27168a44c2af3e31544')
 
package() {
	user=$(basename $HOME)
	echo "Installing for $user"
	install -o $user -Dm0755 "$srcdir/bt-auto-enable-a2dp" "$pkgdir/usr/local/bin/bt-auto-enable-a2dp"
	install -Dm0644 "$srcdir/20-bt-auto-enable-a2dp.rules" "$pkgdir/etc/udev/rules.d/20-bt-auto-enable-a2dp.rules"
}

