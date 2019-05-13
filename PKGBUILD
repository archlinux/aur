# Maintainer: Tobin Jones <jones@tobin.nz>
pkgname=xfemm
pkgver=3.0
pkgrel=1
pkgdesc="Cross platform electromagnetics finite element analysis based on FEMM"
arch=('x86_64')
url="https://sourceforge.net/projects/xfemm/"
license=('custom:Aladdin', 'APACHE')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()

source=("https://cfhcable.dl.sourceforge.net/project/xfemm/Release/Release%203_0/${pkgname}_v${pkgver}_linux64.tar.gz")
noextract=()
md5sums=('6358316d3fc882bc8979b92069bb9536')

build() {
  cd "xfemm_linux64/cfemm"
  cmake .
  make
}

package() {
  cd "xfemm_linux64/cfemm"
  make DESTDIR="$pkgdir/" install
}
