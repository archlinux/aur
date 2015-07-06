# Maintainer: Stefan Seemayer <seemayer@genzentrum.lmu.de>
# Author: Andy Hauser <hauser@genzentrum.lmu.de>

pkgname=hhsuite
pkgver=2.0.16
pkgrel=2
pkgdesc="A set of programs for protein sequence homology detection by iterative HMM-HMM comparison for computational biology like PSI-BLAST"
arch=('i686' 'x86_64')
url="http://hhblits.genzentrum.lmu.de/"
license=(GPL)
depends=('libpng')

source=("ftp://toolkit.lmb.uni-muenchen.de/pub/HH-suite/releases/$pkgname-$pkgver.tar.gz"
        "hhsuite.sh")
md5sums=('39f9c6ed31e49618e7868a5b81f9ddef'
         'fe3864b3095fa7243b67dcee0f95ba38')

build()
{ 
  cd $srcdir/$pkgname-$pkgver/
  make all WITH_NATIVE=1 NO_PNG=1
}

package()
{
  cd $srcdir/$pkgname-$pkgver/
  make install INSTALL_DIR="${pkgdir}/usr"
  install -Dm755 "$srcdir/hhsuite.sh" "${pkgdir}/etc/profile.d/hhsuite.sh"
}

# vim:set ts=2 sw=2 et:
