# Maintainer: boltbuckle <amygdala@cheerful.com>

pkgname=tracktion-4-free
pkgver=4.5.6
pkgrel=1
pkgdesc="Free Legacy Commercial Music Production Software"
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
	"${url}downloads/tracktion-legacy-latest/TracktionInstall_64bit_Linux_${pkgver//\./_}.deb"
	license
	Tracktion-4-Free.desktop
	)
install="tracktion-4-free.install"
md5sums=('9a298dec38edfa7e3ddbe7a70f85771b'
         'd7bac73a1a52d26b337761a1d7ec561d'
         'a4c390855d0ee08cc30754a5f0dd0d33')

package() {
	tar -zxf data.tar.gz -C "${pkgdir}"
	install -Dm644 "$startdir/license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	mv "$pkgdir/usr/bin/Tracktion" "$pkgdir/usr/bin/Tracktion-4-Free"
	rm "$pkgdir/usr/share/applications/Tracktion.desktop"
	cp "$srcdir/Tracktion-4-Free.desktop" "$pkgdir/usr/share/applications/"
	mv "$pkgdir/usr/share/tracktion" "$pkgdir/usr/share/tracktion-4-free"

	msg "---||-------------------------------------------------||"
	msg "---|| All fine and dandy...                           ||"
	msg "---|| Tracktion for Linux is free but in demo mode.   ||"
	msg "---|| Check your machine number in the about dialog.  ||"
	msg "---|| You'll have to register at tracktion.com        ||"
	msg "---|| Sign-up for the Tracktion 4 Free linux version. ||"
	msg "---|| Download the keyfile to unlock the demo mode.   ||"
	msg "---||-------------------------------------------------||"
	}
