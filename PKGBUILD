# Maintainer: Alireza Ayinmehr <alireza.darksun@gmail.com>

pkgname="oie-icons-git"
pkgver=d1c2739
pkgrel=1
pkgdesc=""
arch=('any')
url="https://www.opencode.net/adhe/oieicons"
license=('LGPL3')
makedepends=('git')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver () {
    cd "${srcdir}/${pkgname}/"
    git describe --always
}

package() {
    cd "${srcdir}/${pkgname}/"
	install -dm755 "${pkgdir}/usr/share/icons"
	cp -a "OieIcons" "${pkgdir}/usr/share/icons/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
