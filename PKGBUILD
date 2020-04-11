pkgname=cling-bin
_pkgname=cling
pkgver=20200402
pkgrel=1
pkgdesc="The cling C++ interpreter"
arch=(x86_64)
url="https://root.cern.ch/cling"
license=('Cling Release License')
depends=('ncurses5-compat-libs')

file_name='cling_2020-04-02_ubuntu18'

source=(
  "https://root.cern/download/cling/$file_name.tar.bz2"
)
sha256sums=(
  '70fa2bd9848286da4b0dbf7fb639c91951db05ca0457ea2b857571587b541e39'
)

prepare() {
   tar xvf $file_name.tar.bz2
}

package() {
   install -d "$pkgdir/opt" "$pkgdir/usr/bin"
   mv "$srcdir/$file_name" "$pkgdir/opt/$_pkgname"
   ln -s "/opt/$_pkgname/bin/cling" "$pkgdir/usr/bin"
}
