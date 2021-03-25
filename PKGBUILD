# Maintainer: squitch <clementfoure2005@gmail.com>
pkgname=tess-git
pkgver=1.0
pkgrel=3
pkgdesc="Tess, a simple terminal"
arch=(x86_64)
url="https://github.com/SquitchYT/Tess.git"
license=('unknown')
depends=('glib2' 'glibc')
makedepends=('git' 'npm')
source=("git+$url")
md5sums=('SKIP')

package() {
	cd "Tess"

	npm install

	npm run test-build

	cd "dist/linux-unpacked"
	mkdir -p "${pkgdir}/opt/tess"
	mkdir -p "${pkgdir}/usr/bin"

	cp -r * "${pkgdir}/opt/tess/"

	ln -s "/opt/tess/tess" "${pkgdir}/usr/bin/tess"
}
