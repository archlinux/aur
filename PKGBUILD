# Maintainer: endlesseden
_pkgname=python-pyradiodns
pkgname=$_pkgname-git
pkgver=0.1.r47.ga4dcfd0
pkgrel=1
pkgdesc="Python library that resolves FQDN from the broadcast parameters of an audio service"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/radiodns/pyradiodns"
license=('GPL')
groups=()
depends=('python')
checkdepends=()
optdepends=()
provides=("$_pkgname" "$pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "0.1.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/$_pkgname"
    python setup.py build
}

package() {
	cd "$srcdir/$_pkgname"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
