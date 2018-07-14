# Maintainer: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

pkgname=aliza
pkgver=1.42.1.6
pkgrel=1
pkgdesc="Medical Imaging. Open 2D, 3D and 4D images in DICOM, MetaIO, Nifti, Nrrd and other formats, incl. Meshes in VTK, OBJ and STL formats. Filters, segmentation, front-end for registration with Elastix and many more features."
arch=('x86_64')
url="http://www.aliza-dicom-viewer.com"
license=('custom')
depends=('qt4')
# depends=('dropbox' 'libx11' 'libxt' 'qt4' 'zlib')
options=('!strip' '!emptydirs')
source=("aliza_$pkgver.deb::https://drive.google.com/uc?authuser=0&id=1paJiLBPAPC-suy4GrtmOPYYA46Rj8kUm&export=download")
sha512sums=('da3b7055c1f1c01ed72d5bb92dbb8df5d01eb5835e726a3ed2c8817a0e0cb2449f0d998bab22c4b792624b746c32e802a59227e7a57ea1d3bbcbf4046bd40841')

post_install() {
	xdg-icon-resource forceupdate --theme hicolor &> /dev/null
	update-desktop-database -q
}

post_upgrade() {
	post_install
}

post_remove() {
	xdg-icon-resource forceupdate --theme hicolor &> /dev/null
	update-desktop-database -q
}

package(){

	# Extract package data
	tar xzf data.tar.gz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/share/doc/aliza/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
