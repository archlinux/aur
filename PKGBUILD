# Maintainer: Kamil Krzyżanowski <kamnxt@kamnxt.com>
pkgname=python-npyscreen2-git
pkgver=r47.75ecd73
pkgrel=1
pkgdesc="A fork of npyscreen with changed core components"
arch=('any')
url="https://github.com/SavinaRoja/npyscreen2"
license=('GPL3')
groups=()
depends=('python')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('npyscreen2::git+https://github.com/SavinaRoja/npyscreen2')
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
