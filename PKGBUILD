# Maintainer: Miguel de Val-Borro <miguel at archlinux dot net>
# Contributor: miggy <jkomdl at gmail dot com>

pkgname=jags
pkgver=4.3.0
pkgrel=1
pkgdesc="Bayesian hierarchical models using Markov Chain Monte Carlo (MCMC) simulation"
arch=('x86_64' 'i686')
url="http://mcmc-jags.sourceforge.net/"
license=('GPL')
depends=('lapack' 'libtool')
options=('!libtool')
makedepends=('gcc-fortran' 'lapack')
source=(http://downloads.sourceforge.net/project/mcmc-jags/JAGS/4.x/Source/JAGS-$pkgver.tar.gz)
md5sums=('d88dff326603deee39ce7fa4234c5a43')
build () {
	cd "$srcdir/JAGS-$pkgver"
	./configure --prefix=/usr --libexecdir=/usr/lib/${pkgname}
	make
}
package() {
	cd "$srcdir/JAGS-$pkgver"
	make DESTDIR="$pkgdir/" install
}
