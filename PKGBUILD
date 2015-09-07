# Maintainer: Egan McComb <egan.mccomb@gmail.com>

pkgname=diction
pkgver=1.11
pkgrel=2
pkgdesc="Diction identifies wordy and commonly misused phrases."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/diction/diction.html"
license=('gpl')
source=("http://ftp.gnu.org/gnu/diction/diction-1.11.tar.gz")
md5sums=('4cbdb115c976d7141f54b223df28012e')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd ${srcdir}/$pkgname-$pkgver
  make prefix=${pkgdir}/usr install
}
