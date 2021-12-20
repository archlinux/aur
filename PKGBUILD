pkgbase=harrison-32c-vst
pkgname=("harrison-32c-channel-vst" "harrison-32c-vip-vst")
pkgver=1.0.1.1
pkgrel=1
pkgdesc="Harrison Consoles 32C Console VST Plugins"
arch=('x86_64')
license=('EULA')
groups=('vst-plugins' 'pro-audio')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')

## Variables
_archive="`xdg-user-dir DOWNLOAD`/Harrison-32C-Plugins-Linux-64bit-${pkgver}.tar.gz"

prepare () {
	## Extract Harrison 32C Plugin Archive
	ln -srf ${_archive} "$srcdir/`basename ${_archive}`"
	tar -xvzf "$srcdir/`basename ${_archive}`"
}

package_harrison-32c-channel-vst() {
	url="https://harrisonconsoles.com/product/32c-channel-plugin/"
	## Install 32C VST Plugin
	mkdir -p $pkgdir/usr/lib/vst/
	cp -r "$srcdir/Harrison_32C/vst/32C-Channel.so" $pkgdir/usr/lib/vst/32C-Channel.so
}

package_harrison-32c-vip-vst() {
	url="https://harrisonconsoles.com/product/32c-vocal-intensity-processor/"
	## Install 32C VST Plugin
	mkdir -p $pkgdir/usr/lib/vst/
	cp -r "$srcdir/Harrison_32C/vst/32C-VIP.so" $pkgdir/usr/lib/vst/32C-VIP.so
}
