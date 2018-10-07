# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fsleyes-widgets
pkgver=0.6.4
pkgrel=1
pkgdesc="FSLeyes is the FSL image viewer, widgets is one of its dependent projects"
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
depends=('python')
makedepends=('python-six' 'python-numpy' 'python-matplotlib' 'python-wxpython>=4.0.1-2' 'python-deprecation')
optdepends=()
provides=()
conflicts=()
replaces=()
source=($pkgname-$pkgver.tar.gz::https://git.fmrib.ox.ac.uk/fsl/fsleyes/widgets/repository/archive.tar.gz?ref=$pkgver)
sha256sums=('4466a61033c0192310454677b84b3fc7a19672af89ea7ae64c2f31edf31f4f91')

package() {
  cd "$srcdir/${pkgname#fsleyes-}-$pkgver-"*
  # "Patching" for deprecation 2.x support
  sed -i 's/deprecation>=1\.\*,<=2\.\*/deprecation>=1\.\*/g' requirements.txt
  python setup.py install --root="$pkgdir/" --optimize=1
}
