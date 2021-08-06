pkgbase=libvlc-plugins
pkgname=('libvlc-plugins')
_pkgname=vlc
pkgver=5.6.0
_pkgver=3.0.16-3
pkgrel=6
pkgdesc="The plugins for VLC library"
arch=('x86_64')
url='https://www.videolan.org/LibVLC/'
license=('LGPL2.1')
source=("https://archive.archlinux.org/packages/v/${_pkgname}/${_pkgname}-${_pkgver}-x86_64.pkg.tar.zst")
sha512sums=('ae240450d4c017eda1161a5a88fbc9ab325b036440a6dbebb18e06d5803e0208f8c2337aa2f8ecc4838d391f47da7ea4d53a5a7b7fdb99454f09cadf44a62a21')

package_libvlc-plugins() {
	depends=('libvlc')
	provides=("libvlc=$pkgver" "vlc") # This should not provide vlc but all arch packages dep on vlc when they only need libvlc
	conflicts=('vlc')
	cd $srcdir/usr/lib
	mkdir -p $pkgdir/usr/lib
	cp -R vlc $pkgdir/usr/lib
}
