# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=montepython
pkgname=python-$_modulename
pkgver=3.4.0
pkgrel=2
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
sha256sums=('ce4f889bd9c11359122749e03f804257c31fc962bde8fbe6a6259897fabca0fd')

package() {
  cd "$srcdir/${_modulename}_public-v${pkgver}"
  mv montepython/likelihoods/kids450_cf_likelihood_public/CUT_VALUES/ data/
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
}
