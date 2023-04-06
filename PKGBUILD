# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Frank Siegert <frank.siegert@googlemail.com>

pkgname=fastjet
pkgver=3.4.0
pkgrel=2
pkgdesc="A particle physics package for jet finding in pp and e+e- collisions."
arch=('x86_64')
url="http://fastjet.fr"
license=('GPL2')
depends=('bash')
makedepends=('gcc-fortran' 'python')
source=("http://fastjet.fr/repo/$pkgname-$pkgver.tar.gz")
sha512sums=('af8aeb6197f6bd82ec5f127647f49cd5d455c20e614c23d928b850fc97bc12c70cf6e3b09f1bb0308c2a080fcd4fa13416eea0195695060efaa0e400a687d7b7')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --enable-allplugins --enable-static=no --enable-pyext
  make
}

check() {
  cd $pkgname-$pkgver
  make -k check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
