# Contributor: Sara <sara at archlinux dot us>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=tdq
pkgver=0.1
pkgrel=1
pkgdesc="A fast dictionary lookup program."
arch=('i686' 'x86_64')
license=('GPL')
url="http://litcave.rudi.ir"
source=("http://litcave.rudi.ir/${pkgname}.tar.gz")
install=${pkgname}.install
md5sums=('66476065dcb062b84edecfef18ad5df5')
sha1sums=('13561100d912900cd6cd3b320c5f4c46b3a723a9')
sha256sums=('a74c2e6cb48aafaeabac6cd76def92b464c90ce37f5523f0398506f102ebe44d')

build(){
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  for i in *.c; do
    install -Dm755 "${i%.c}" "${pkgdir}/usr/bin/${i%.c}"
  done
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

