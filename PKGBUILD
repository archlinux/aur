# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Macfly <mmacfly@gmail.com>
# Contributor: Duncan Ferguson <duncan_ferguson@users.sourceforge.net>

pkgname=clusterssh
_pkgver=4.02_04
pkgver=${_pkgver/_/.}
pkgrel=2
pkgdesc="Cluster SSH opens terminal windows with connections to specified hosts and an administration console."
arch=('any')
url="http://clusterssh.sourceforge.net/"
license=('GPL')
depends=('xterm' 'perl-file-which' 'perl-extutils-makemaker' 'perl-test-differences'
         'perl-test-pod' 'perl-test-pod-coverage' 'perl-test-trap' 'perl-try-tiny'
         'perl-tk' 'perl-x11-protocol' 'perl-exception-class')
source=(http://downloads.sourceforge.net/$pkgname/App-ClusterSSH-$_pkgver.tar.gz)
sha256sums=('a16142261ca83bee871005f9293f4f54da8c24918a6b439cee1f774ed4f0eb5a')

build() {
  cd App-ClusterSSH-$_pkgver
  perl Makefile.PL
  make
}

package() {
  cd App-ClusterSSH-$_pkgver
  make DESTDIR="$pkgdir" install
}
