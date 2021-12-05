# Maintainer: Elia A. <elia@elinvention.ovh>

_pkgname=efiboots
pkgname="$_pkgname-git"
pkgver=1.0.r0.ga127150
pkgrel=2
pkgdesc="Manage EFI boot loader entries with this simple GUI"
url="https://github.com/Elinvention/efiboots"
license=('GPL3')
arch=('any')
depends=('python-gobject' 'efibootmgr' 'python3' 'gtk4')
makedepends=('git' 'python-setuptools')
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname"
	python setup.py install --root="$pkgdir" --optimize=1
}
