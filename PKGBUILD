# Maintainer: Matthijs Tadema <M dot J dot Tadema at protonmail dot com>
# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

pkgname=martinize-git
pkgver=v0.3.1.r8.2a50f80
pkgrel=1
pkgdesc="Describe and apply transformation on molecular structures and topologies"
arch=('any')
url="https://github.com/marrink-lab/vermouth-martinize"
license=('Apache')
depends=('python>=3.5' 'python-pbr' 'python-setuptools>=30.3.0' 'python-numpy'
		 'python-networkx')
makedepends=('git')
checkdepends=()
optdepends=('python-sphinx: docs generation'
			'python-scipy: pairwise distance calculation')
provides=('martinize')
conflicts=('martinize')
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/marrink-lab/vermouth-martinize.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}


package() {
        cd ${srcdir}/${pkgname}
        /usr/bin/env python3 setup.py install --prefix="$pkgdir/usr/"
}
