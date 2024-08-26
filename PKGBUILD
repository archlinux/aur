# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_pkgname=simple-websocket-server
pkgname=python-$_pkgname-git
pkgver=r102.7a9b037
pkgrel=1
pkgdesc="A python based websocket server that is simple and easy to use."
arch=('any')
url="https://github.com/dpallot/simple-websocket-server"
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
