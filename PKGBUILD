# Contributor: Jaroslav Lichtblau <tu@dragonlord.cz>

pkgname=jobqueue
pkgver=0.04
pkgrel=1
pkgdesc="Executes jobs in parallel to complete all jobs as fast as possible."
arch=('i686')
url="http://zakalwe.fi/~shd/foss/jobqueue/"
license=('custom')
source=(http://zakalwe.fi/~shd/foss/$pkgname/$pkgname-$pkgver.tar.bz2)

md5sums=('1359411da77ab5e40d20a3cad2e94745')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  install -d "${pkgdir}/usr/bin"

  ./configure --prefix=/usr --package-prefix=${pkgdir}
  make || return 1
  make DESTDIR="${pkgdir}" install

#license file
  install -D -m644 "COPYING" "${pkgdir}/usr/share/licenses/$pkgname/COPYING" || return 1
}
