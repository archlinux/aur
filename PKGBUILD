# Mantainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>


pkgname=wxmacmolplt
pkgver=7.7.1
pkgrel=1
pkgdesc="An open-source gui for preparing, submitting and visualizing input and output for the GAMESS quantum chemistry package."
url="https://brettbode.github.io/wxmacmolplt/"
license=("GPL2")
arch=(x86_64)
depends=('wxgtk2' 'glew')
source=(https://uofi.box.com/shared/static/k9n011zbgato5ravmpozq9xekh8udmcn.gz)

sha256sums=('827d96a105f4faa78c9f99ad9d996e2d01077208f1db0d098ffcefefccb5808d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=${pkgdir} install
}


