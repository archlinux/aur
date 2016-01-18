# Maintainer: Jonas Frei freijon <freijon@gmail.com>

pkgname=nuvola-app-digitally-imported-git
pkgver=r0.39115fb
pkgrel=1
pkgdesc="Digitally Imported integration for Nuvola Player."
arch=('any')
url="https://github.com/ItzBlitz98/nuvola-app-digitally-imported"
license=('custom: BSD')
depends=('nuvolaplayer-git')
makedepends=('git')
source=("${pkgname}::git+https://github.com/ItzBlitz98/nuvola-app-digitally-imported.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	make build
}

package() {
	cd "$pkgname"
	install -vCDm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	make install DEST="${pkgdir}/usr/share/nuvolaplayer3/web_apps"
}
