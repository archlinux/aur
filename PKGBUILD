# Contributor: Sebastian Wolf <swolf at melonkru dot de>
pkgname=advancescan
pkgver=1.18
pkgrel=1
pkgdesc="A command line rom manager for AdvanceMAME, AdvanceMESS and any other MAME derivative"
arch=('i686' 'x86_64')
url='http://www.advancemame.it/scan-readme.html'
depends=('')
license=('GPL')
source=("https://github.com/amadvance/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('85d964fe0d34a5722ce923f7fbb8a115')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  # Binaries
  install -D -m755 advscan $pkgdir/usr/bin/advscan
  install -D -m755 advdiff $pkgdir/usr/bin/advdiff
  # Documentation
  install -D -m644 doc/advscan.1 $pkgdir/usr/share/man/man1/advscan.1
  install -D -m644 doc/advdiff.1 $pkgdir/usr/share/man/man1/advdiff.1
}
