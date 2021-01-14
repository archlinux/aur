# Maintainer: Fabio Zanini <fabio.zanini _at_ fastmail.fm>
pkgname=python-scikit-bio
pkgver=0.5.6
pkgrel=1
pkgdesc="Python package providing data structures, algorithms, and educational resources for bioinformatics"
arch=('x86_64')
url="https://github.com/biocore/scikit-bio"
license=('BSD')
depends=(
python
python-future
python-decorator
python-six
python-contextlib2
python-natsort
python-bz2file
python-lockfile
python-pandas
python-scipy
python-numpy
python-matplotlib
python-requests
python-cachecontrol
python-msgpack
python-scikit-learn
python-hdmedians
)
makedepends=('python-setuptools')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/biocore/scikit-bio/archive/${pkgver}.tar.gz")
sha256sums=('69cf88626ff3803625aa65c7f6792f431318bd31f2b4d5c79e9a71cfc29c37ea')

build() {
  cd scikit-bio-${pkgver}
  python setup.py build
}

check(){
  cd scikit-bio-${pkgver}
  python setup.py test || :
}

package() {
  cd scikit-bio-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
