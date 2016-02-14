# Contributor: Calogero e Angelo Scarnà <info@codelinsoft.it>
pkgname=codicefiscale
pkgver=3.0
pkgrel=2
pkgdesc="The tax code in Italy is an alphanumeric code with a fixed length of 16 characters, inspired by the use of library, which is used to uniquely identify the tax and administrative citizens." 
url="http://www.codelinsoft.it/sito/2013-11-17-17-56-34/codice-fiscale.html"
arch=('i686' 'x86_64')
depends=('qt5-base' 'qt5-connectivity' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-multimedia' 'qt5-svg' 'qt5-tools'  'qt5-translations' 'qt5-webkit' 'qt5-websockets' 'qt5-x11extras' 'qt5-xmlpatterns' )
license=(LGPL)
source=(http://www.codelinsoft.it/sito/download/categoria-linux/CodiceFiscale/codicefiscale-3-0targz.raw)
md5sums=("f62d26470b128e28d03f1c61f514eef4")



build() {
cd "${srcdir}/${pkgname}-${pkgver}"
cmake -DCMAKE_INSTALL_PREFIX=/opt -DWANT_QT5=ON 
make -j5
}

package() {
cd "${srcdir}/${pkgname}-${pkgver}"
install -d "$pkgdir"/opt
install -dm 755 ${pkgdir}/opt/codicefiscale
cp -rv  "${srcdir}/${pkgname}-${pkgver}/cod_fisc/codicefiscale" "${pkgdir}/opt/codicefiscale/"
cp -rv  "${srcdir}/${pkgname}-${pkgver}/update" "${pkgdir}/opt/codicefiscale/"
cp -rv  "${srcdir}/${pkgname}-${pkgver}/cod_fisc/images/codicefisc.png" "${pkgdir}/opt/codicefiscale/"
cp -rv  "${srcdir}/${pkgname}-${pkgver}/cod_fisc/codicefiscale.db" "${pkgdir}/opt/codicefiscale/"
install -Dm644  "${srcdir}/${pkgname}-${pkgver}/cod_fisc/desktop/codicefiscale.desktop" "${pkgdir}/usr/share/applications/codicefiscale.desktop"


}

