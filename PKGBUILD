# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_pkgname=getdist
pkgname=python-$_pkgname-git
pkgver=r112.de5e238
pkgrel=1
pkgdesc="MCMC sample analysis, kernel densities, plotting, and GUI"
arch=('any')
url="https://github.com/cmbant/getdist"
license=()
groups=()
depends=('python-numpy' 'python-matplotlib' 'python-six' 'python-scipy' 'python-pyside' 'python-pandas')
makedepends=('git' 'python-setuptools')
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
