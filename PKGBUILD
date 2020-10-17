# Maintainer: Nicklas Botö <bruski@nicklasbotö.se>
pkgname=bruski
pkgver=1.1.r235.c3a32b6
pkgrel=1
pkgdesc="The BruSKI language compiler and platform"
arch=(x86_64)
url="https://github.com/NicklasBoto/BruSKI.git"
license=('GPL')
depends=()
makedepends=(git make stack)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/BruSKI"
	printf "1.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/BruSKI"
	bash install.sh
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 syntax/BruSKI.vim ~/.vim/syntax/BruSKI.vim 
	install -Dm644 syntax/bru.vim ~/.vim/ftdetect/bru.vim
}
