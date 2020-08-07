# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-archivo-narrow-git
pkgver=r49.0a98e4d
pkgrel=1
pkgdesc="Archivo Narrow was designed to be used simultaneously in print and digital platforms"
arch=('any')
url="https://github.com/Omnibus-Type/ArchivoNarrow"
license=('custom:OFL')
source=("${pkgname}::git+${url}.git")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${pkgname}"/fonts/ttf

	install -d "${pkgdir}"/usr/share/fonts/TTF
	install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF
	install -D -m644 ../../OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
