# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoża <piotr dot r dot public at gmail dot com>

pkgname=pyexiftoolgui-git
pkgver=b53a0b5
pkgrel=1
pkgdesc='a python pyside graphical frontend for the excellent open source command line tool ExifTool'
arch=('any')
url='https://github.com/hvdwolf/pyExifToolGUI'
license=('GPL')
groups=()
depends=(python2-pyside perl-image-exiftool)
makedepends=(git desktop-file-utils python2)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='pyExifToolGUI.install'
noextract=()
source=('git://github.com/hvdwolf/pyExifToolGUI.git'
fix.patch
)
_gitname='pyExifToolGUI'
md5sums=('SKIP'
         '975bc40effce83f53cbf74edafcaac24')
pkgver() {
  cd "$srcdir/repo"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
prepare() {
  cd "$srcdir"/$_gitname
  patch -p1 < $srcdir/fix.patch
}
package(){
  cd "$srcdir"/$_gitname
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

