# Maintainer: misaka10987 <misaka10987@outlook.com>

pkgname=elegit-bin
pkgver=1.1
pkgrel=1
pkgdesc="Git learning tool"
arch=('x86_64')
license=('MIT')
provides=("elegit")
source=("https://github.com/dmusican/Elegit/releases/download/v1.1/Elegit-1.1-linux.deb")
md5sums=('9a3f826e8fdd8c733d7d310963fe5d8c')
url="https://elegit.org"

prepare() {
    mv Elegit-1.1-linux.deb ${pkgver}_${pkgver}.deb
    ar -x ${pkgver}_${pkgver}.deb
    mkdir ${pkgname}-${pkgver}
    tar -xf data.tar.xz --directory="${pkgname}-${pkgver}"
}

package() {
  cd "$pkgname-$pkgver"
  cp -r ./ ${pkgdir}/
}
