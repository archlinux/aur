## Maintainer: realasking
pkgname=caledonia-tux-plymouth-theme-modified
pkgver=0.2
pkgrel=1
pkgdesc='A plymouth theme originally created by RHBLIND from store.kde.org, patched by realasking with a little adjustment and a changed icon Newtux from wikipedia created by lewing@isc.tamu.edu Larry Ewing and The GIMP.'
arch=(x86_64 i686)
url='https://store.kde.org/content/show.php/?content=143641'
license=('other')
depends=('plymouth')
source=(
	'https://dl.opendesktop.org/api/files/download/id/1460735566/143641-caledonia-tux.tar.bz2'
	'patch4newtux4caledonia.patch'
	'logo.png'
)
md5sums=(
	'd0eae27df6add846329cecdce15d967c'
	'a0a0219311e22f0b3103ff5c99f62f25'
	'386f111dfb73e4c39e5be292abb3f4f9'
)

prepare() {
	cd "${srcdir}"
	patch -p0 <patch4newtux4caledonia.patch 
	cp logo.png caledonia-tux  
}

package() {
	mkdir -p "${pkgdir}/usr/share/plymouth/themes/"
	cp -r "${srcdir}/caledonia-tux" "${pkgdir}/usr/share/plymouth/themes/caledonia-tux"
}
