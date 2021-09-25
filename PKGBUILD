pkgname=harrison-32c-vst
pkgver=1.0.0
pkgrel=1
pkgdesc="Harrison Consoles 32C Console VST Plugin"
arch=('x86_64')
url="https://harrisonconsoles.com/product/32c-channel-plugin/"
license=('EULA')
groups=('vst-plugins' 'pro-audio')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')

## Variables
_archive="`xdg-user-dir DOWNLOAD`/Harrison-32C-Channel-Linux-64bit-1.0"

prepare () {
	## Extract Harrison 32C Plugin Archive
	ln -srf ${_archive}.tar.gz "$srcdir/`basename ${_archive}`.tar.gz"
	tar -xvzf "$srcdir/`basename ${_archive}`.tar.gz"
}

package() {
	## Install 32C VST Plugin
	mkdir -p $pkgdir/usr/lib/vst/
	cp -r "$srcdir/Harrison_32C-Channel/vst/32C-Channel.so" $pkgdir/usr/lib/vst/32C-Channel.so
}
