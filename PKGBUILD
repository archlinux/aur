# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_pkgname=python-margarine
pkgname=$_pkgname-git
pkgver=r82.e62b1db
pkgrel=1
pkgdesc="Posterior Sampling and Marginal Bayesian Statistics"
arch=('any')
url="https://github.com/htjb/margarine"
license=('MIT')
groups=()
depends=(python-numpy python-tensorflow python-tensorflow-probability python-scipy)
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
