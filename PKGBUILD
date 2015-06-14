# Submitter: L.G. Sarmiento <lgsarmientop-ala-unal.edu.co>
pkgname=fairyspec-git
pkgver=20140505
pkgrel=1
pkgdesc="Flexible Analysis of IRradiation Yields"
url="http://sourceforge.net/p/fairyspec/code/ci/master/tree/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gsl' 'fftw' 'gtkmm')
makedepends=('git')
#optdepends=('')
provides=("fairyspec")
options=('!libtool' '!emptydirs')
#install=""
md5sums=()

_gitroot="git://git.code.sf.net/p/fairyspec/code"

build() {
  [ -d ${srcdir}/${pkgname} ] || mkdir ${srcdir}/${pkgname}


  cd ${srcdir}/${pkgname}
  git clone --depth 1 $_gitroot .

  ./autogen.sh \
    --prefix=/usr \
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR=${pkgdir} install
}
