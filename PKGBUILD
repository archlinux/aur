# Maintainer: aliu <aaron liu 0130 @ gmail . com>

pkgname=foobar2000-component-openlyrics-bin
pkgver=1.12
pkgrel=1
_fooname='foo_openlyrics'
pkgdesc='FOSS lyrics UI component for foobar2000 (column & default UI)'
arch=('any')
url="https://www.github.com/jacquesh/${_fooname}"
license=('MIT')
provides=(${_fooname} foobar2000-component-openlyrics)
depends=('foobar2000>=2.0.0')
source=("https://github.com/jacquesh/${_fooname}/releases/download/v${pkgver}/${_fooname}-v${pkgver}.fb2k-component"
		"https://github.com/jacquesh/${_fooname}/raw/refs/heads/main/LICENSE")
sha256sums=('c006065da41029c7037e0f40d6977494d281c9ced7a4c8abd9c7e7a7c06296d7'
'51c8f956ae74ee8c452a4238fe8100ab55b51bd5eb79088766237753c23edde4')

package() {
	if [[ "$CARCH" == x86_64 ]]; then
		install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/" "$srcdir/x64/${_fooname}.dll"
	else
		install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/" "$srcdir/${_fooname}.dll"
	fi
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/LICENSE"
}
