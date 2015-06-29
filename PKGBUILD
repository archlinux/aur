pkgname=mphconv
pkgver=0.0.3
pkgrel=1
pkgdesc="Converts miles to minutes, given miles and MPH"
arch=('i686' 'x86_64')
url="http://tweakdeveloper.github.io/mphconv"
license=('BSD')
depends=('glibc')
source=("https://github.com/tweakdeveloper/mphconv/archive/${pkgver}.tar.gz")
sha256sums=('be0c8e7ead3cf1d187a3287dccaf494331b831ba9c6610198301e440c59a7705')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="%{pkgdir}"
}
