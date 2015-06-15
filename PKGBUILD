# Maintainer: Moritz Lipp <mlq@pwmt.org>
pkgname=python2-uniconvertor
_pkgname=python-uniconvertor
pkgver=2.0
pkgrev=rev338
pkgrel=1
pkgdesc="Universal vector graphics translator"
arch=('x86_64')
url="http://sk1project.org/modules.php?name=Products&product=uniconvertor"
license=('GPL')
depends=('python')
options=(!emptydirs)
install=
source=(http://sk1project.org/dc2.php?target=$_pkgname-$pkgver-${pkgrev}_0ubuntu1_13.04_amd64.deb)
md5sums=('3562a5acf6534f7455c329ecee1fb930')

package() {
  cd "$srcdir"
  tar -xf data.tar.gz -C $pkgdir

  # Fix python path
  sed -i 's/python/python2/g' $pkgdir/usr/bin/uniconvertor

  # Fix package path
  mv $pkgdir/usr/lib/python2.7/dist-packages $pkgdir/usr/lib/python2.7/site-packages
}

# vim:set ts=2 sw=2 et:
