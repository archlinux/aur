# Maintainer: Ghabry <gabriel-aur mastergk de>

pkgname=mapdamage
pkgver=2.0.9
pkgrel=1
pkgdesc="Tracking and quantifying damage patterns in ancient DNA sequences"
arch=('i686' 'x86_64')
url="https://ginolhac.github.io/mapDamage"
license=('MIT')
depends=('python2' 'python2-pysam' 'gsl')
makedepends=('python2-setuptools')
optdepends=('r: For statistical estimation of DNA damage parameters')
install=mapdamage.install
source=("https://github.com/ginolhac/mapDamage/archive/$pkgver.tar.gz")
sha256sums=('25fadf8a1a0a1f6fcd0df283201edcb308bc6ee35264f6ac81a8efe8b7357508')

package() {
  cd mapDamage-$pkgver

  python2 setup.py install --root="$pkgdir/" --optimize=1

  # license
  install -Dm0644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
