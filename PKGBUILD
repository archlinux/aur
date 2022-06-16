# Maintainer: Kimi <noreply@nodomain.org>

pkgname=kimi-linphone-desktop-beta
pkgver=0.0.0.0
pkgrel=0
pkgdesc="The Hello World program."
arch=('x86_64')
url="http://ftp.gnu.org/gnu"
license=('GPL3')
depends=('glibc')
makedepends=('make' 'libtool' 'automake' 'autoconf' 'gettext' 'curl')
source=(${pkgname}_${pkgver}.orig.tar.gz)
sha256sums=('ab344f8dcc5a8e816f6a33dc604f193b9c551ff54ee6e90693ad57483618a7e8')
provides=('kimi-linphone-desktop-beta')
conflicts=('kimi-linphone-desktop-beta')

prepare() {
  echo "--- Entering section prepare() ---"
  echo \$HOME=$HOME
  #export LANGUAGE="en_US.UTF-8"
  export LANGUAGE=C
  #export LC_ALL="en_US"
  export LC_ALL=C
  #export LANG="en_US.UTF-8"
  export LANG=C
  CURRENTDIR=$(pwd)
  echo CURRENTDIR=$CURRENTDIR
  echo 
  find $CURRENTDIR
  cd "$srcdir/${pkgname}-${pkgver}"
  autoreconf -f -i
  ./configure
  echo "--- Exiting section prepare() ---"
}

build() {
  echo "--- Entering section build() ---"
  echo \$HOME=$HOME
  #export LANGUAGE="en_US.UTF-8"
  export LANGUAGE=C
  #export LC_ALL="en_US"
  export LC_ALL=C
  #export LANG="en_US.UTF-8"
  export LANG=C
  CURRENTDIR=$(pwd)
  echo CURRENTDIR=$CURRENTDIR
  echo srcdir=$srcdir
  echo pkgdir=$pkgdir
  echo pkgver=$pkgver
  find $CURRENTDIR
  cd "$srcdir/${pkgname}-${pkgver}"
  autoreconf -f -i
  ./configure
  make
  echo "--- Exiting section build() ---"
}

package() {
  echo "--- Entering section package() ---"
  CURRENTDIR=$(pwd)
  echo CURRENTDIR=$CURRENTDIR
  echo srcdir=$srcdir
  echo pkgdir=$pkgdir
  echo pkgver=$pkgver
  find $CURRENTDIR
  mkdir -p $pkgdir/usr/local/bin
  find $CURRENTDIR
  # Our executable is located in:
  # .../src/hello-world
  # We want to move the executable to the real install prefix: /usr/local/bin
  install -Dm755 $srcdir/$pkgname-$pkgver/src/hello-world $pkgdir/usr/local/bin/hello-world-alpha
  find $CURRENTDIR
  echo "--- Exiting section package() ---"  
}

