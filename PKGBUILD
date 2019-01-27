# Maintainer: 3ED <krzysztofas at protonmail com>

pkgname=qqsp
_pkgname=Qqsp
_name="QT Quest Soft Player"
_desc="a interactive fiction stories and games player"
pkgver=1.8
pkgrel=1
epoch=
pkgdesc="$_name is $_desc (compatible fork of qsp.su)"
arch=("x86" "x86_64")
url="https://gitlab.com/Sonnix1/Qqsp"
license=('MIT')
depends=("qsp-common" "qt5-webengine" "qt5-multimedia")

source=(
	"${_pkgname}::git+https://gitlab.com/Sonnix1/Qqsp.git#tag=v$pkgver"
	"Qqsp.desktop"
)
sha256sums=(
	'SKIP'
	'SKIP'
)

build() {
	cd "${_pkgname}"
	qmake \
		PREFIX=/usr # ???

	make
}

package() {
	install -dm0755 "$pkgdir"/usr/{bin,share/{applications,licenses/qqsp}}/

	install -m0755 "$_pkgname/Qqsp" "$pkgdir/usr/bin/"
	install -m0644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/qqsp/"

	install -m0644 "Qqsp.desktop" "$pkgdir/usr/share/applications/"
}
