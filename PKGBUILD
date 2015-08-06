# Maintainer: Grey Christoforo <my first name at my last name dot net>

pkgname=cura
pkgver=15.06.02
pkgrel=1
pkgdesc="A software solution for 3D printing aimed at RepRaps and the Ultimaker (built from source)."
depends=('python2' 'wxpython' 'python2-opengl' 'python2-pyserial' 'python2-numpy' 'python2-power-git')
provides=('cura')
url="https://ultimaker.com/en/products/cura-software"
license=('AGPLv3')
arch=('i686' 'x86_64')
source=(https://github.com/Ultimaker/Cura/archive/${pkgver}.tar.gz)
sha1sums=('3dd2affd90183a9c9ad5ea95f653b4936cc93657')

install=cura.install

build()
{
	cd "${srcdir}"
	
	# unpack
	#tar --xz -xf data.tar.xz
}

package()
{
	msg2 "Packaging"
	# remove python-power since we have it in the deps:
	#rm -rf "${srcdir}"/usr/share/cura/power/
	
	# change python to python2 everywhere:
	#sed -i 's|\/usr\/bin\/python|\/usr\/bin\/python2|' "${srcdir}"/usr/share/applications/cura.desktop "${srcdir}"/usr/share/cura/cura.py "${srcdir}"/usr/bin/cura
	
	# add a new line (pedantic):
	#echo >> "${srcdir}/usr/bin/cura"
	
	# add the path since we need to call slicer exactly from /usr/share/cura
	#sed -i '6 i os.chdir("/usr/share/cura")' "${srcdir}"/usr/share/cura/cura.py
	#sed -i 's|os.path.dirname(__file__)|"/usr/share/cura"|' "${srcdir}"/usr/share/cura/cura.py
	
	#cp -r "${srcdir}"/usr "${pkgdir}"/usr
	
}


