#
pkgname=libreoffice-extension-formatting-math-formulas
_pkgname=faf
pkgver=0.1.6
pkgrel=1
pkgdesc="This extension allows formatting of all (or selected) Math formulas in your document. Works in Writer, Calc, Draw and Impress."
arch=('any')
url="https://extensions.libreoffice.org/extensions/formatting-of-all-math-formulas"
license=('MIT')
groups=('libreoffice-extensions')
depends=(libreoffice)
noextract=("FAF-${pkgver}.oxt")
source=(https://extensions.libreoffice.org/extensions/formatting-of-all-math-formulas/0-1.6/@@download/file/FAF-0.1.6.oxt)
sha512sums=('cfc5920faa7b07a660d657e1d1f85d10408135877ccaa49ee5ebebde17abe5747993da13fc7394970c6d644a9ea2e54458c995a04ad384226359dcf42448b44a')

package() {

   _DESTDIR="${pkgdir}/usr/lib/libreoffice/share/extensions/${_pkgname}/"
   install -dm755 "${_DESTDIR}"
   bsdtar -xf FAF-${pkgver}.oxt -C "${_DESTDIR}"
   chmod -R a=r,a+X,u+w "${_DESTDIR}"

}

