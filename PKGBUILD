# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=montepython
pkgname=python-$_modulename
pkgver=3.5.0
pkgrel=1
pkgdesc="The Monte Carlo code for class in Python"
arch=(any)
url="https://github.com/brinckmann/${_modulename}_public"
license=()
groups=()
depends=("python-class" "python-polychord")
makedepends=("python-setuptools")
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('40963df98036e4fddea479de533480b85faca9beb5f6cf52965813323056b89d')

package() {
  cd "$srcdir/${_modulename}_public-${pkgver}"
  mv montepython/likelihoods/kids450_cf_likelihood_public/CUT_VALUES/ data/
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
}
