# Contributor: zoe <chp321 [at] gmail (dot) com>
# Maintainer: zoe <chp321 [at] gmail (dot) com>

pkgname=bordermaker
pkgname1=BorderMaker
pkgver=5.0
pkgrel=7
pkgdesc="a java application to resize and decorate pictures with borders, text and watermarks"
arch=('any')
url="http://www.bordermaker.nl/en/"
license=("GPL")
depends=('jre6' 'java-runtime-common' 'kdesudo')
source=("http://www.${pkgname}.nl/en/wp-content/uploads/downloads/2011/01/${pkgname1}-${pkgver}.zip"
        "${pkgname}"
        "${pkgname}.desktop"
        "${pkgname}.png")
md5sums=('4efc81f63719a7dbeea5d16e523ca27c'
         '3ad1a279c369031ee2f14c89d1095a4b'
         '542175a49d4bff871460aea4238bda6c'
         '3801ec433301421564b209912e6af5cc')
noextract=("${pkgname}.jar")



package() {
cd $srcdir
mkdir -p "${pkgdir}/usr/share/java/${pkgname}"
install -D -m644 ./${pkgname1}.jar $pkgdir/usr/share/java/${pkgname}/
install -D -m755 ./${pkgname} $pkgdir/usr/bin/${pkgname}
install -D -m644 $srcdir/${pkgname}.png $pkgdir/usr/share/pixmaps/${pkgname}.png
install -D -m644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
}
