# Maintainer: Bruce <zttt183525594@gmail.com>

_pkgname=wechat_web_devtools
pkgname=wechat-web-devtools-git
pkgver=r13.1c8a6ad
pkgrel=1
pkgdesc="Wechat Web Developer Tools"
arch=("any")
url="https://github.com/yuan1994/${_pkgname}"
license=('unknown')
groups=()
depends=()
makedepends=('git')
provides=()
conflicts=()
install="wechat-web-devtools-git.install"
source=("git://github.com/yuan1994/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"
	find ./ -type f -exec install -Dm755 {} \
	    "${pkgdir}/opt/tencent/${_pkgname}/{}" \;
	install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
