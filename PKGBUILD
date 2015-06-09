# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
# Contributor: Army
_pkgname=paulstretch
pkgname=$_pkgname-git
pkgver=0.r23.7f5c399
pkgrel=1
pkgdesc="a program for stretching the audio"
arch=('i686' 'x86_64')
url="http://hypermammut.sourceforge.net/paulstretch"
license=('GPL2')
depends=('fltk' 'mxml' 'portaudio' 'audiofile' 'fftw' 'libmad')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/paulnasca/paulstretch_cpp.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  ./compile_linux_fftw.sh
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=2 sw=2 et:
