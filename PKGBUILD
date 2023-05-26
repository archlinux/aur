pkgname=harrison-32c-plugins-bin
pkgver=20230526
pkgrel=1
pkgdesc="Harrison Consoles 32C Console VST Plugins"
url="https://harrisonconsoles.com/32c-plugins/"
arch=('x86_64')
license=('EULA')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')
groups=('pro-audio' 'vst-plugins')

## Variables
_archive="`xdg-user-dir DOWNLOAD`/Harrison-32C-Plugins-Linux-64bit.tar.gz"

prepare() {
	## Extract Harrison 32C Plugin Archive
	ln -srf ${_archive} "$srcdir/`basename ${_archive}`"
	tar -xvzf "$srcdir/`basename ${_archive}`"
}

package() {
	## Install VST
	mkdir -p "$pkgdir/usr/lib/vst"
	cp -r "$srcdir/Harrison_32C/vst/32C-Bus.so" "$pkgdir/usr/lib/vst/32C-Bus.so"
	cp -r "$srcdir/Harrison_32C/vst/32C-Channel.so" "$pkgdir/usr/lib/vst/32C-Channel.so"
	cp -r "$srcdir/Harrison_32C/vst/32C-VIP.so" "$pkgdir/usr/lib/vst/32C-VIP.so"
}
