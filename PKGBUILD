pkgname=cling-bin
_pkgname=cling
pkgver=20200908
pkgrel=1
pkgdesc="The cling C++ interpreter"
arch=(x86_64)
url="https://root.cern.ch/cling"
license=('Cling Release License')
depends=('ncurses5-compat-libs')

file_name='cling_2020-09-08_ROOT-ubuntu2004'

source=(
  "https://root.cern/download/cling/$file_name.tar.bz2"
)
sha256sums=(
  '2c75766f120c907fe96339cb0ce9f6ef6c60aa4d831d450de50d64c6384769a1'
)

prepare() {
   tar xvf $file_name.tar.bz2
}

package() {
   install -d "$pkgdir/opt" "$pkgdir/usr/bin"
   mv "$srcdir/$file_name" "$pkgdir/opt/$_pkgname"
   ln -s "/opt/$_pkgname/bin/cling" "$pkgdir/usr/bin"
}
