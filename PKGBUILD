# Maintainer: nem <nem at posteo dot net>
# Submitter: nem <nem at posteo dot net> 

pkgname=adms-git
pkgver=2.3.4.r29.g9c5bd52
pkgrel=1
pkgdesc="ADMS is a codegenerator for the VERILOG-A(MS) language"
arch=('x86_64' 'i686')
url="https://github.com/qucs/adms"
license=('GPL')
depends=('glibc')
makedepends=('git' 'autoconf' 'automake' 'flex' 'bison' 'perl-gd' 'perl-xml-libxml')
options=(!makeflags)
source=(git+https://github.com/qucs/adms)
md5sums=('SKIP')

pkgver() {
  cd adms 
  git describe --long | sed -r 's/^release-//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd adms 
  ./bootstrap.sh
  ./configure --enable-maintainer-mode --prefix=/usr
  make
}

package() {
  cd adms 
  make DESTDIR="$pkgdir" install

}
