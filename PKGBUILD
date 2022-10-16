# Maintainer: xezo360hye <xezo360hye@gmail.com>
# Contributor: K4zoku <kazoku0356@gmail.com>
_pkgname="nowm"
pkgname="${_pkgname}-git"
pkgver=r50.76a5557
pkgrel=1
pkgdesc="Managing window without a window manager"
arch=('any')
url="https://github.com/K4zoku/nowm"
license=('MIT')
depends=('sh' 'xdotool')
makedepends=('git')
optdepends=('xorg-xinit: for starting Xorg automatically')
provides=('nowm')
conflicts=('nowm')
source=("${_pkgname}::git+https://github.com/K4zoku/nowm.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 "bin/nowm" -t "${pkgdir}/usr/bin"
	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "man/nowm.1" -t "${pkgdir}/usr/share/man/man1"
}
