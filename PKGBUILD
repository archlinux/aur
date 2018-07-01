#
pkgname=libreoffice-extension-formatting-math-formulas
_pkgname=faf
pkgver=0.1.8
pkgrel=1
pkgdesc="This extension allows formatting of all (or selected) Math formulas in your document. Works in Writer, Calc, Draw and Impress."
arch=('any')
url="https://extensions.libreoffice.org/extensions/formatting-of-all-math-formulas"
license=('MIT')
groups=('libreoffice-extensions')
depends=(libreoffice)
noextract=("FAF-${pkgver}.oxt")
source=(https://extensions.libreoffice.org/extensions/formatting-of-all-math-formulas/0-1.8/@@download/file/FAF-0.1.8.oxt)
sha512sums=('90ec126f6fb59f73494fea0d76a61230bb2052677d7c44ddb08fcc451aa07b9c80efb7b0cf6fe2673db756bf8dbc5f529f8e01a1f62c155ca87d35a4c8a157fb')

package() {

   _DESTDIR="${pkgdir}/usr/lib/libreoffice/share/extensions/${_pkgname}/"
   install -dm755 "${_DESTDIR}"
   bsdtar -xf FAF-${pkgver}.oxt -C "${_DESTDIR}"
   chmod -R a=r,a+X,u+w "${_DESTDIR}"

}

