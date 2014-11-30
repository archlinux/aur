# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=jobqueue
pkgver=0.04
pkgrel=1
pkgdesc="Executes jobs in parallel to complete all jobs as fast as possible"
arch=('i686' 'x86_64')
url="http://zakalwe.fi/~shd/foss/jobqueue/"
license=('custom')
source=(http://zakalwe.fi/~shd/foss/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('1359411da77ab5e40d20a3cad2e94745')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr --package-prefix="${pkgdir}"
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -d "${pkgdir}"/usr/bin
  make DESTDIR="${pkgdir}" install

#license file
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/$pkgname/COPYING
}