# Ilya Dikariev <dikiy_evrej_REMOVE_THIS_SHIT_at_web.de>

pkgname=defendguin
pkgver=0.0.13
pkgrel=1
pkgdesc="The arcade oldschool fly and shot game"
arch=('i686' 'x86_64')
url="http://www.newbreedsoftware.com/defendguin"
license=('GPL')
groups=()
depends=('sdl_mixer' 'sdl')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("ftp://ftp.tuxpaint.org/unix/x/defendguin/src/defendguin-0.0.13.tar.gz" Makefile.patch)
noextract=()
md5sums=('11ffbe135c26f579359cd5bd396c1462' '90808584660a8948b58569934bce05e4') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p2 < ../../Makefile.patch
  make PREFIX="/usr"
}

package() {
        cd "$srcdir/$pkgname-$pkgver"
        make PREFIX="$pkgdir/usr/" MAN_PREFIX="$pkgdir/usr/share/" install 
}

