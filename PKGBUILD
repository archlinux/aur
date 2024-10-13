#
pkgname=libreoffice-extension-formatting-math-formulas
_pkgname=faf
pkgver=0.1.9
pkgrel=1
pkgdesc="This extension allows formatting of all (or selected) Math formulas in your document. Works in Writer, Calc, Draw and Impress."
arch=('any')
url="https://extensions.libreoffice.org/extensions/formatting-of-all-math-formulas"
license=('MIT')
groups=('libreoffice-extensions')
depends=(libreoffice)
noextract=("FAF-${pkgver}.oxt")
source=(https://extensions.libreoffice.org/assets/downloads/389/FAF-0.1.9.oxt)
sha512sums=('42dd55509f0a6aa5d22f6bcb0adc867567789c1bc0f2df8d0290a92b3d891ed2b4cdb7a730a75be67b87bcbd1b558ee3abfa9618a9f3908b0bbb1b528602eb60')

package() {

   _DESTDIR="${pkgdir}/usr/lib/libreoffice/share/extensions/${_pkgname}/"
   install -dm755 "${_DESTDIR}"
   bsdtar -xf FAF-${pkgver}.oxt -C "${_DESTDIR}"
   chmod -R a=r,a+X,u+w "${_DESTDIR}"

}

