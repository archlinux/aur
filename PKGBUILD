# Maintainer: Egor Vorontsov <sdoregor@gmail.com>

pkgname=ttf-ubuntu-mono-ligaturized-git
_pkgname=ubuntu-mono-ligaturized
_gitcommit=0539771f148c14e7ea59198efbf80d5214fd7fa7
pkgver=3.0.0
pkgrel=1
pkgdesc="Ubuntu Mono font with programming ligatures"
arch=(any)
url="https://github.com/datavis-tech/${_pkgname}"
license=(GPL)
makedepends=(git)
provides=(ttf-ubuntu-mono-ligaturized)
conflicts=(ttf-ubuntu-mono-ligaturized)
source=("git+${url}.git#commit=$_gitcommit")
sha256sums=('SKIP')

### no 3.0.0 tag yet
#pkgver() {
#	cd "${_pkgname}"
#	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
#}
###

package() {
	cd "${_pkgname}"
	install -Dm644 *.ttf -t "${pkgdir}/usr/share/fonts/TTF"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
