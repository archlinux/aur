# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=ufetch-git
pkgver=v0.1.r26.21f22c2
pkgrel=1
pkgdesc='Tiny system info for Unix-like operating systems'
arch=(any)
url=https://gitlab.com/jschx/ufetch
license=(ISC)
makedepends=(git)
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "${srcdir}/${pkgbase%-git}"
	install -Dm755 "${pkgbase%-git}-arch" "${pkgdir}/usr/bin/${pkgname%-git}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
