# Maintainer: Ke Liu <spcter119@gmail.com>
pkgname=fermisurfer
pkgver=2.1.0
_release=71529
pkgrel=1
pkgdesc="Fermisurfer can display Fermi surfaces colored as a function of arbitraly quantities such as the orbital character."
arch=(any)
url=https://osdn.net/projects/fermisurfer/
depends=(wxgtk2 freeglut)
source=(https://osdn.net/projects/fermisurfer/downloads/$_release/fermisurfer-$pkgver.tar.gz)
noextract=()
sha512sums=(78ec5536206fa028791777f1bbca041112c39aef21120180ef05332c9c0138b54bb4e36eed899ef48a4b9ba3df97fc7079a5ef48f24c489ac198c7200cdf1d2e)
validpgpkeys=()

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=$pkgdir/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make install
}
