# Manteiner: Giuseppe Federico <support@digisoftware.org>
# Contributor: lobisquit

pkgname=jfbchat
pkgver=0.2.4
pkgrel=1
pkgdesc='Application designed to offer you a simple and intuitive Facebook chat client'
url=("http://www.digisoftware.org/")
arch=('x86_64' 'i686')
license=('GPL')
depends=('jre7-openjdk')
optdepends=()
makedepends=()
source=("http://heanet.dl.sourceforge.net/project/${pkgname}/${pkgname}_${pkgver}/${pkgname}_${pkgver}.tar.gz" jfbchat.desktop jfbchat-icon.png)
noextract=("${pkgname}_${pkgver}.tar.gz")

md5sums=('37ea169495c100db12a4bd101c7af740'
         'b5248dfe6756189ead0ecbae9d6faa8b'
         'f4be785322fefea711af2e2eab04dbd2')

build() {
	mkdir -p "${srcdir}/${pkgname}-${pkgver}"
	cd "${srcdir}/${pkgname}-${pkgver}"
	# bsdtar -xf ${srcdir}/"${pkgname}_${pkgver}.tar.gz"
	cp ${srcdir}/"${pkgname}_${pkgver}.tar.gz" "${srcdir}/${pkgname}-${pkgver}"
	cp ${srcdir}/${pkgname}-icon.png ${pkgname}-icon.png
	cp ${srcdir}/${pkgname}.desktop ${pkgname}.desktop 
}	

package () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p ${startdir}/pkg/opt/
	mkdir -p ${startdir}/pkg/usr/share/applications
	bsdtar -xf ${pkgname}_${pkgver}.tar.gz -C ${startdir}/pkg/opt/
	cp ${pkgname}-icon.png ${startdir}/pkg/opt/${pkgname}_${pkgver}/${pkgname}-icon.png
	cp ${pkgname}.desktop ${startdir}/pkg/usr/share/applications
}
