# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=montepython
pkgname=python-$_modulename
pkgver=3.3.0
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
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('818d88673bae1232b5955819098a4769f7ce61721b88931f527c63d486c06ca4')

package() {
  cd "$srcdir/${_modulename}_public-${pkgver}"
  mv montepython/likelihoods/kids450_cf_likelihood_public/CUT_VALUES/ data/
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
}
