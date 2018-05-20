# Maintainer: Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=astroimagej
pkgver=3.2.0
_reldate=20160201
pkgrel=2
pkgdesc="ImageJ for Astronomy"
arch=('any')
url="http://www.astro.louisville.edu/software/astroimagej/"
depends=('java-environment')
license=('GPL')
noextract=("AstroImageJ_v${pkgver}_${_reldate}_linux.tar.gz")
source=("${url}/installation_packages/AstroImageJ_v${pkgver}_${_reldate}_linux.tar.gz"
        "aij")
sha1sums=('22938e075cd72604db1e1c732286002503a957bf'
         '0e9c9bfdcef5a076176126551f36807b3beb321d')

package() {
	
	cd ${srcdir}

	mkdir ${pkgdir}/opt
	cp "AstroImageJ_v${pkgver}_${_reldate}_linux.tar.gz" ${pkgdir}/opt
	cd ${pkgdir}/opt
	tar zxvf "AstroImageJ_v${pkgver}_${_reldate}_linux.tar.gz"
	mv ${pkgdir}/opt/AstroImageJ ${pkgdir}/opt/astroimagej

	cd ${srcdir}
	install -D -m755 aij ${pkgdir}/usr/bin/aij
  
}

