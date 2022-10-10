# Maintainer: ThatOneCalculator <kainoa@t1c.dev>

_pkgname="spamton-shimeji"
pkgname="${_pkgname}"
pkgver=r71.c47c06a
pkgrel=2
pkgdesc="Spamton Shimeji to make your Xorg desktop [[NumberOneBestRatedArchRice]]"
arch=(any)
url="https://codeberg.org/thatonecalculator/spamton-linux-shimeji"
license=('Custom')
depends=(openjdk8-src libx11)
source=("${_pkgname}::git+https://codeberg.org/thatonecalculator/spamton-linux-shimeji.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p "${pkgdir}/usr/share/spamton"
	cp -r ./* "${pkgdir}/usr/share/spamton"
	install -Dm755 ./spamton -t "${pkgdir}/usr/bin"
	install -Dm755 ./desktop/Spamton.desktop -t "${pkgdir}/usr/share/applications"
	install -Dm755 ./desktop/spamton.png -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
	install -Dm644 ./LICENSE -t "${pkgdir}/usr/share/licenses/spamton"
	echo "Installed [[NumberOneBestRatedSalesman1997]]! Don't forget to run on Xorg (with a compositor)."
}
