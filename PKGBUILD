# Maintainer: 
pkgname=livestreamer-livehousein-git
_pythonver=3.5
pkgver=r6.3bedff7
pkgrel=1
pkgdesc="Livehouse.in Livestreamer plugin - git version"
arch=(any)
url="https://github.com/nitpicker/livestreamer.plugin.livehouse.in"
license=('GPL')
groups=()
depends=('livestreamer')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/nitpicker/livestreamer.plugin.livehouse.in.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd "$srcdir/${pkgname%-git}"
	for py in cavetube.py livehouse.py; do
	install -Dm644 $py "${pkgdir}/usr/lib/python${_pythonver}/site-packages/livestreamer/plugins/$py"
	done
}
