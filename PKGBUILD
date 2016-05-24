# Maintainer: Samuel Mansour (s83) <samipnt+aur@gmail.com>
# Upstream URL: https://github.com/tiliado/nuvola-app-mixcloud

# Please do mind that pkgbuild will automagically update
# to latest tagged release (you could have problems if you use an aur helper),
# there's no need to manually change pkgver.
# Please don't flag out-of-date!
pkgname=nuvola-app-mixcloud-git
pkgver=3.0.r0.g1c5126b
pkgrel=1

pkgdesc="Mixcloud integration for Nuvola Player from Github"
url="https://github.com/tiliado/nuvola-app-mixcloud"
license=('custom:BSD')
arch=('any')

depends=('nuvolaplayer-git')
makedepends=('git')

source=("${pkgname}::git+https://github.com/tiliado/nuvola-app-mixcloud.git")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	make install DEST="${pkgdir}/usr/share/nuvolaplayer3/web_apps"
}
