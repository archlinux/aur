# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_pkgname=python-ads
pkgname=$_pkgname-git
pkgver=r313.7939be2
pkgrel=1
pkgdesc="Python tool for ADS "
arch=('any')
url="https://github.com/andycasey/ads"
license=('MIT')
groups=()
depends=(python-werkzeug)
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
