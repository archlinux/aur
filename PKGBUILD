# Maintainer: Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=astroimagej
pkgver=5.1.0
pkgrel=00
pkgdesc="ImageJ for Astronomy"
arch=('any')
url="http://www.astro.louisville.edu/software/astroimagej/"
depends=('java-environment-common')
license=('GPL')
source=("${url}/installation_packages/AstroImageJ_v${pkgver}.${pkgrel}_linux_x64_java18.tar.gz"
        "aij")
sha1sums=('25167866a9da45166b030b4bfbdc18eb33097fb0'
         'a09026bbb1c482dfb28651c1163c3e574c23a838')

package() {
	
	cd ${srcdir}
	tarfile="AstroImageJ_v${pkgver}.${pkgrel}_linux_x64_java18.tar.gz"

	mkdir ${pkgdir}/opt
	cp $tarfile ${pkgdir}/opt
	cd ${pkgdir}/opt
	tar zxvf $tarfile
	rm $tarfile
	mv ${pkgdir}/opt/AstroImageJ ${pkgdir}/opt/astroimagej

	cd ${srcdir}
	install -D -m755 aij ${pkgdir}/usr/bin/aij
  
}

