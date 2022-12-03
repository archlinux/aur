pkgname=harrison-ava-plugins-bin
pkgver=20221027
pkgrel=1
pkgdesc="Harrison AVA VST Plugin Suite"
url="https://www.harrisonconsoles.com/site/ava-plugins.html"
arch=('x86_64')
license=('EULA')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')
groups=('pro-audio' 'vst-plugins')

prepare () {
	## Extract AVA Plugins Archive
	_archive="`xdg-user-dir DOWNLOAD`/Harrison-AVA-linux-64bit.tar.gz"
	ln -srf ${_archive} "$srcdir/`basename ${_archive}`"
	tar -xvzf "$srcdir/`basename ${_archive}`"
}

package() {
	## Install VST
	install -Dm755 "$srcdir/Harrison_AVA/vst/AVA-BF.so" "$pkgdir/usr/lib/vst/AVA-BF.so"
	install -Dm755 "$srcdir/Harrison_AVA/vst/AVA-DS.so" "$pkgdir/usr/lib/vst/AVA-DS.so"
	install -Dm755 "$srcdir/Harrison_AVA/vst/AVA-LegacyQ.so" "$pkgdir/usr/lib/vst/AVA-LegacyQ.so"
	install -Dm755 "$srcdir/Harrison_AVA/vst/AVA-LV.so" "$pkgdir/usr/lib/vst/AVA-LV.so"
	install -Dm755 "$srcdir/Harrison_AVA/vst/AVA-MC.so" "$pkgdir/usr/lib/vst/AVA-MC.so"
	install -Dm755 "$srcdir/Harrison_AVA/vst/AVA-ME.so" "$pkgdir/usr/lib/vst/AVA-ME.so"
	install -Dm755 "$srcdir/Harrison_AVA/vst/AVA-SC.so" "$pkgdir/usr/lib/vst/AVA-SC.so"
	install -Dm755 "$srcdir/Harrison_AVA/vst/AVA-DF.so" "$pkgdir/usr/lib/vst/AVA-DF.so"
	install -Dm755 "$srcdir/Harrison_AVA/vst/AVA-VF.so" "$pkgdir/usr/lib/vst/AVA-VF.so"
}
