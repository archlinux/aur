# Maintainer: miggy <jkomdl at gmail dot com>

pkgname=jags
pkgver=3.4.0
pkgrel=2
pkgdesc="Bayesian hierarchical models using Markov Chain Monte Carlo (MCMC) simulation"
arch=('x86_64' 'i686')
url="http://mcmc-jags.sourceforge.net/"
license=('GPL')
depends=('lapack' 'libtool')
options=('!libtool')
makedepends=('gcc-fortran' 'lapack')
source=(http://downloads.sourceforge.net/project/mcmc-jags/JAGS/3.x/Source/JAGS-$pkgver.tar.gz)
md5sums=('ac8242931837e4367b2a3de8b231aa0e')
build () {
	cd "$srcdir/JAGS-$pkgver"
	./configure --prefix=/usr --libexecdir=/usr/lib/${pkgname}
	make
}
package() {
	cd "$srcdir/JAGS-$pkgver"
	make DESTDIR="$pkgdir/" install
}




