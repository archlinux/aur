# Maintainer: Tekato <takutekato2@gmail.com>

pkgname=git-when-merged
pkgver=v1.2.0.r2.ab6af78
pkgrel=1
arch=('any')

pkgdesc="Determine when a particular commit was merged into a git branch"

url="https://github.com/mhagger/git-when-merged"
license=('GPL2')
depends=('git' 'python')
source=("${pkgname}::git+https://github.com/mhagger/git-when-merged.git")
cksums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

}

package() {
	cd "${srcdir}/$pkgname"
	install -D bin/git-when-merged "$pkgdir/usr/bin/git-when-merged"
}
