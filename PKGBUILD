# Maintainer: xiretza <xiretza+aur@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jesin <jesin00@gmail.com>
# Contributor: Gabriele Lanaro <gabriele.lanaro@gmail.com>

pkgname=f2c
pkgver=1.0
pkgrel=9
pkgdesc='Fortran to C code translator'
url='http://www.netlib.org/f2c/index.html'
license=('custom')
makedepends=('git')
arch=('x86_64' 'i686')
source=("git://github.com/juanjosegarciaripoll/f2c.git#commit=d01fe07")
md5sums=('SKIP')

prepare() {
  cd "$pkgname"
  ./autogen.sh
}

build() {
  cd "$pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  make -C "$pkgname" DESTDIR="$pkgdir" install
  install -Dm644 "${pkgname}/COPYRIGHT" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
} 

# vim:set ts=2 sw=2 et:
