# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=ufetch-git
pkgver=0.3.r0.g12b68fa
pkgrel=1
pkgdesc='Tiny system info for Unix-like operating systems'
arch=(any)
url=https://gitlab.com/jschx/ufetch
license=(ISC)
depends=(bash)
makedepends=(git)
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/v//;s/-/.r/;s/-/./')"
}

package() {
	cd "${srcdir}/${pkgbase%-git}"
	install -Dm755 "${pkgbase%-git}-arch" "${pkgdir}/usr/bin/${pkgname%-git}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
