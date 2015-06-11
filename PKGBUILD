# Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Contributor: Richard Pougnet: Richard Pougnet ca
# Contributor: zimt email: $MYNICKNAME at enveng dot de
pkgname=python2-scitools
pkgver=0.9.0
pkgrel=5
pkgdesc="python library for scientific computing"
arch=(any)
url="https://github.com/hplgit/scitools"
license=('custom:BSD Simplified')
depends=('python2') 
makedepends=('python2' 'python2-numpy' 'gnuplot' 'python2-gnuplot' )
optdepends=('python2-scipy' 'python2-scientificpython' 'vtk')
source=("https://github.com/hplgit/scitools/archive/scitools-${pkgver}.tar.gz")
sha512sums=('90ff58136e0d9e6b13018c5f31db9cb68e37938f00e9f07c828c814ed065c8fc14aa6a795170f2616d95e3d39f1e72cfbebc328ee7e489e500d9481f458b6545')

package() {
  # Perform installation.
  cd "$srcdir/scitools-scitools-$pkgver"
  python2 setup.py install --root=$pkgdir

  # Copy license file.
  mkdir -pv ${pkgdir}/usr/share/licenses/$pkgname
  install -m644 $srcdir/scitools-scitools-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/
}
