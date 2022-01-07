# Mantainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>


pkgname=wxmacmolplt
pkgver=7.7.2
pkgrel=1
pkgdesc="An open-source gui for preparing, submitting and visualizing input and output for the GAMESS quantum chemistry package."
url="https://brettbode.github.io/wxmacmolplt/"
license=("GPL2")
arch=(x86_64)
depends=('wxgtk3' 'glew')
source=(https://uofi.box.com/shared/static/ezm1jd56hlb8s2vsf9ou28vrctjqqa9o.gz)

sha256sums=('eef23c27c664616c740f8805a61db7efc055ed8db5d69bafcec69eafafe297e4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=${pkgdir} install
}


