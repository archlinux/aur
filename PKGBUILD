# Contributor: Calogero e Angelo Scarnà <info@codelinsoft.it>
pkgname=codicefiscale
pkgver=2.2.1
pkgrel=2
pkgdesc="The tax code in Italy is an alphanumeric code with a fixed length of 16 characters, inspired by the use of library, which is used to uniquely identify the tax and administrative citizens." 
url="http://www.codelinsoft.it/sito/2013-11-17-17-56-34/codice-fiscale.html"
arch=('i686' 'x86_64')
depends=('qt4')
license=(LGPL)
source=(http://www.codelinsoft.it/sito/download/categoria-linux/CodiceFiscale/codice-fiscale-source.raw)
md5sums=("5f1ddab88c84b972f9bca075cdaf6ebf")



build() {
cd "${srcdir}/${pkgname}-${pkgver}"
qmake-qt4 
make -j5
}

package() {
cd "${srcdir}/${pkgname}-${pkgver}"
install -d "$pkgdir"/opt
install -dm 755 ${pkgdir}/opt/codicefiscale
cp -rv  "${srcdir}/${pkgname}-${pkgver}/cod_fisc/codicefiscale" "${pkgdir}/opt/codicefiscale/"
cp -rv  "${srcdir}/${pkgname}-${pkgver}/cod_fisc/update" "${pkgdir}/opt/codicefiscale/"
cp -rv  "${srcdir}/${pkgname}-${pkgver}/cod_fisc/images/codicefisc.png" "${pkgdir}/opt/codicefiscale/"
install -Dm644  "${srcdir}/${pkgname}-${pkgver}/cod_fisc/desktop/codicefiscale.desktop" "${pkgdir}/usr/share/applications/codicefiscale.desktop"


}

