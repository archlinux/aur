# Maintainer: boltbuckle <amygdala@cheerful.com>
# Contributor: Christopher Arndt <chris@chrisarndt.de>

pkgname=tracktion-6
pkgver=6.1.9
pkgrel=1
pkgdesc="Commercial Music Production Software"
arch=('x86_64')
url="http://www.tracktion.com/"
license=('custom')
depends=('alsa-lib' 'mesa')
optdepends=(
	'jack: A low-latency audio server'
	'ladspa-plugins: a set of ladspa plugins'
	)
conflicts=()
source=(
	"${url}downloads/tracktion6-64/TracktionInstall_${pkgver//\./_}_Linux_64Bit.deb"
	'license' 
	'Tracktion6.desktop'
	)
install="tracktion.install"
md5sums=('5e6485ed69610551d52bb523ce922389'
         'd7bac73a1a52d26b337761a1d7ec561d'
         '6fca61296f0c1ebadfc09afdb794f8a9')

package() {
	tar -x --lzma -f data.tar.lzma -C "${pkgdir}"
	rm "$pkgdir/usr/share/applications/tracktion.desktop"
	install -Dm644 "$startdir/license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$startdir/Tracktion6.desktop" "$pkgdir/usr/share/applications/"

	msg "---||-------------------------------------------------||"
	msg "---|| All fine and dandy...                           ||"
	msg "---|| Tracktion for Linux is free but in demo mode.   ||"
	msg "---|| Check your machine number in the about dialog.  ||"
	msg "---|| You'll have to register at tracktion.com        ||"
	msg "---|| Sign-up for the free linux version.             ||"
	msg "---|| Download the keyfile to unlock the demo mode.   ||"
	msg "---||-------------------------------------------------||"
	}
