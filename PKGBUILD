# Maintainer: Moritz Lipp <mlq@pwmt.org>
pkgname=python2-printdesign
_pkgname=python-printdesign
pkgver=1.0
pkgrev=rev497
pkgrel=1
pkgdesc="Open-source illustration program"
arch=(any)
url="http://sk1project.org"
license=('GPL')
depends=('python2' 'python2-uniconvertor')
options=(!emptydirs)
install=
source=(http://sk1project.org/dc2.php?target=$_pkgname-$pkgver-${pkgrev}_all.deb)
md5sums=('d4009fa0e71012cb6c6e46f00f111b3b')

package() {
  cd "$srcdir"
  tar -xf data.tar.gz -C $pkgdir

  # Fix python path
  sed -i 's/python/python2/g' $pkgdir/usr/bin/printdesign

  # Fix package path
  mv $pkgdir/usr/lib/python2.7/dist-packages $pkgdir/usr/lib/python2.7/site-packages
}

# vim:set ts=2 sw=2 et:
