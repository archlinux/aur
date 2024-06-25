# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=git-quick-git
pkgver=0.0.0.r6.ge2b6a1f
pkgrel=1
pkgdesc='edit a subset of files from a git repository on any branch'
arch=(x86_64)
url="https://github.com/qwertzguy/${pkgname%-git}"
license=(MIT)
depends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git tag v0.0.0 8c8b03a ||:
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${pkgname%-git}"
	install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-git}"
}
