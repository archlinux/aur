# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_pkgname=gpyopt
pkgname=python-$_pkgname-git
pkgver=r514.0be0508
pkgrel=1
pkgdesc="Gaussian Process Optimization using GPy"
arch=('any')
url="https://github.com/SheffieldML/GPyOpt"
license=()
groups=()
depends=(python)
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
