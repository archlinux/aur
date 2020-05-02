#Maintainer: Fuzzbop <fuzzbop@gmail.com>
pkgname=emumenu-git
pkgver=r59.834a62a
pkgrel=1
pkgdesc="emuMenu is a simple rom launcher made with very large collections and no flair in mind."
arch=('i686' 'x86_64')
url="https://github.com/fuzzbop/emuMenu"
license=('GPL3')
depends=('python' 'python-pyqt5')
makedepends=('git')
source=("git+$url.git" "emuMenu.sh")
md5sums=('SKIP' 
         'dd70b56ed235fffd3fafce2f6491fc39')
_pkgname=emuMenu

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  mkdir -p $pkgdir/usr/share/$_pkgname
  cp -r * $pkgdir/usr/share/$_pkgname/
  install -Dm755 $srcdir/$_pkgname.sh $pkgdir/usr/bin/$_pkgname
}
