# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_pkgname=fgivenx
pkgname=python-$_pkgname-git
pkgver=r274.e1dc023
pkgrel=1
pkgdesc="Functional Posterior Plotter"
arch=('any')
url="https://github.com/williamjameshandley/fgivenx"
license=('MIT')
groups=()
depends=(python-numpy python-matplotlib python-scipy python-joblib python-mpi4py python-tqdm)
makedepends=(git python-setuptools)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+$url.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
