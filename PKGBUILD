# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=fgivenx
pkgname=python-$_modulename
pkgver=2.2.0
pkgrel=0
pkgdesc="Functional Posterior Plotter"
arch=(any)
url="https://github.com/williamjameshandley/fgivenx"
license=('MIT')
groups=()
depends=('python-numpy' 'python-matplotlib' 'python-scipy' 'python-joblib' 'python-mpi4py' 'python-tqdm')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c3d5a41309f1acd61cb577c1a321da810f238e38ba71ef45eef1e2ece6141175')

package() {
  cd "$srcdir/$_modulename-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
check() {
  cd "$srcdir/$_modulename-$pkgver" 
  python setup.py test
}
