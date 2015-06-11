# Maintainer: boltbuckle <amygdala@cheerful.com>

pkgname=tracktion-5
pkgver=5.4.3
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
source=("http://www.tracktion.com/downloads/tracktion64/Tracktioninstall_${pkgver//\./_}_Linux_64Bit.deb" 'license')
md5sums=('49712f3c6a87ac160ac523021eb30bd9'
         'd7bac73a1a52d26b337761a1d7ec561d')

package() {
	tar -zxf data.tar.gz -C "${pkgdir}"
	mkdir -p $pkgdir/usr/share/licenses/$pkgname/
	install -m644 $startdir/license $pkgdir/usr/share/licenses/$pkgname/LICENSE
	sed -i '/Categories=AudioEditing;/c\Categories=AudioEditing;AudioVideo;Audio;' \
	$pkgdir/usr/share/applications/Tracktion.desktop
	msg "---||-------------------------------------------------||"
	msg "---|| All fine and dandy...                           ||"
	msg "---|| Tracktion for Linux is free but in demo mode.   ||" 
	msg "---|| Check your machine number in the about dialog.  ||"
	msg "---|| You'll have to register at tracktion.com        ||"
	msg "---|| and download a keyfile to unlock the demo mode  ||"
	msg "---||-------------------------------------------------||"
	}
