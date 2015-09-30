# Contributor: Calogero e Angelo Scarnà <info@codelinsoft.it>
pkgname=lylibrary
pkgver=2.1.1
pkgrel=1
pkgdesc="LyLibrary provides everything necessary to the books cataloguing, the loans management and the registration of the library readers." 
url="http://www.codelinsoft.it/sito/2013-11-17-17-56-34/lylibrary.html#"
arch=('i686' 'x86_64')
depends=('qt4' 'mysql' 'qca-ossl')
license=(LGPL)
source=(http://www.codelinsoft.it/sito/download/categoria-linux/LyLibrary/lylibrary-sorgentesource.raw)
md5sums=("4d6663c7e675b282219673565f290ce3")



build() {
cd "${srcdir}/${pkgname}-${pkgver}"
qmake-qt4 
make -j5
}

package() {
cd "${srcdir}/${pkgname}-${pkgver}"
install -d "$pkgdir"/opt
install -dm 755 ${pkgdir}/opt/lylibrary
cp -rv  "${srcdir}/${pkgname}-${pkgver}/lylibrary/lylibrary" "${pkgdir}/opt/lylibrary"
cp -rv  "${srcdir}/${pkgname}-${pkgver}/lylibrary/images/logo4.png" "${pkgdir}/opt/lylibrary/"
install -m 755 -d "${pkgdir}/opt/lylibrary/plugin"
install -m 755 -d "${pkgdir}/opt/lylibrary/data"
cp -rv  "${srcdir}/${pkgname}-${pkgver}/lylibrary/data/" "${pkgdir}/opt/lylibrary/"

install -Dm644  "${srcdir}/${pkgname}-${pkgver}/lylibrary/desktop/lylibrary.desktop" "${pkgdir}/usr/share/applications/lylibrary.desktop"

cp -rv  "${srcdir}/${pkgname}-${pkgver}/lylibrary/plugin/" "${pkgdir}/opt/lylibrary/"





}

