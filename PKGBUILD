# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_pkgname=lscsoft-glue
pkgname=python2-$_pkgname-git
pkgver=r56231.42fcf346d4
pkgrel=1
pkgdesc="The LIGO Scientific Consortium Algorithm Library Suite. ${_pkgname}"
arch=('any')
url="https://wiki.ligo.org/DASWG/LALSuiteInstall"
license=()
groups=()
depends=('python2')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('lalsuite::git+https://github.com/lscsoft/lalsuite.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/lalsuite"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/lalsuite/glue"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
