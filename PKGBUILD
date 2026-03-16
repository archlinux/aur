# Mantainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>


pkgname=wxmacmolplt
pkgver=7.7.3
pkgrel=1
pkgdesc="An open-source gui for preparing, submitting and visualizing input and output for the GAMESS quantum chemistry package."
url="https://brettbode.github.io/wxmacmolplt/"
license=("GPL2")
arch=(x86_64)
depends=('wxwidgets-gtk3' 'glew')

source=(https://uofi.box.com/shared/static/i4ljyf53c1jveymhsg4wuwad4a49fm6f.gz)

sha256sums=('3496ce625819879394357687fce3170649ecc3157efe9a5fac96f9e49bd94f38')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=${pkgdir} install
}


