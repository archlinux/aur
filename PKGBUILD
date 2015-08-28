# Maintainer: Maximilien Di Dio      <mrgamerlix@gmail.com>

pkgname=piconnect-git
_pkgname_simple=Piconnect
pkgver=54.d3730da
pkgrel=1
pkgdesc="Small program wich allow to create easily a ssh connexion with a Raspberry Pi."
arch=('any')
url="https://gitlab.com/MaximilienLIX/Piconnect"
license=('GPL2')
depends=('openssh' 'tigervnc')
makedepends=('git')
source=("git+https://gitlab.com/MaximilienLIX/Piconnect.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname_simple"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
      install -d "$pkgdir/usr/bin/"
      install -d "$pkgdir/usr/share/man/man1/"
      
      install -m755 "$srcdir/$_pkgname_simple/src/"{piconnect,piconnect_functions.sh} "$pkgdir/usr/bin"
      install -m644 "$srcdir/$_pkgname_simple/doc/piconnect.gz" "$pkgdir/usr/share/man/man1/"
}
