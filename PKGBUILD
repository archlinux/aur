# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>
pkgname=eercase
_year=2014
_month=07
_day=02
# Reverse the filename's date for version continuity
pkgver=${_year}${_month}${_day}
pkgrel=2
pkgdesc="Enhanced Entity-Relationship (EER) modelling application"
arch=('x86_64')
url="http://www.cin.ufpe.br/~eercase"
license=('unknown')
depends=('java-runtime>=7' 'glibc')
source=("https://www.dropbox.com/s/4tql379hfammtve/${pkgname}_linux_${_day}${_month}${_year}.zip?dl=1"
	"eercase.desktop"
	"eercase.png")
md5sums=('f1ea245a87152f244af735cd054d22d0'
         '982dbb5a3400c4a67caf22a2c43c8763'
         '2bb69e6ae6f1644f12783afb87124fcc')

package(){
	cd "${srcdir}"
	install -Dm0644 "eercase.png" "${pkgdir}/usr/share/icons/eercase.png"
	install -Dm0644 "eercase.desktop" "${pkgdir}/usr/share/applications/eercase.desktop"

	mkdir -p "${pkgdir}/usr/share"
	mkdir -p "${pkgdir}/usr/bin"
	cp -r "${pkgname}"/ "${pkgdir}/usr/share/"
	ln -s "/usr/share/eercase/eercase" "${pkgdir}/usr/bin/eercase"
}
