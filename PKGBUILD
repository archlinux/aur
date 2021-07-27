# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=u2o-git
pkgver=0.7_0_gb8194e0
pkgrel=1
_branch=master
pkgdesc='USFM to OSIS bible format converter'
arch=(any)
url=https://github.com/adyeths/u2o
license=(Unlicense)
depends=(python)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --always --long --tags --abbrev=7 HEAD |
		sed 's/^v//;s/-/_/g'
}

package() {
	cd "${pkgname%-git}"
	install -Dm0755 u2o.py "$pkgdir/usr/bin/u2o"
	install -Dm0755 utaglist.py "$pkgdir/usr/bin/utaglist"
}
