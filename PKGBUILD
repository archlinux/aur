# Maintainer: IronVeil <linux at ironveil dot anonaddy dot me>
pkgname=crystal-remix-icon-theme-git
pkgver=v1.1.r0.g238b626
pkgrel=1
pkgdesc='A remixed Crystal icon theme for KDE Plasma 5'
arch=('any')
license=('LGPL')
url="https://www.pling.com/p/1226130"
makedepends=('git')
source=("$pkgname::git+https://github.com/dangvd/crystal_remix.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"
	rm README
}

package() {
	cd "$srcdir"
	install -dm755 "${pkgdir}/usr/share/icons/"
	cp -drf --no-preserve='ownership' . "${pkgdir}/usr/share/icons/"
}
