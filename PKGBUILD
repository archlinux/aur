# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Sara <sara at archlinux dot us>
# Contributor: aksr <aksr at t-com dot me>
pkgname=tdq
pkgver=0.2
pkgrel=2
pkgdesc="A fast dictionary lookup program."
arch=('i686' 'x86_64' 'aarch64')
license=('GPL')
url="https://litcave.rudi.ir"
source=("https://web.archive.org/web/20150802123131/https://litcave.rudi.ir/tdq.tar.gz")
install=${pkgname}.install
sha256sums=('a74c2e6cb48aafaeabac6cd76def92b464c90ce37f5523f0398506f102ebe44d')

build(){
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  for i in *.c; do
    install -Dm755 "${i%.c}" "${pkgdir}/usr/bin/${i%.c}"
  done
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

