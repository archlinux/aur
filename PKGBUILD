# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='em-keyboard'
pkgdesc='Command-line utility for referencing emoji characters by name'
pkgver='0.0.7'
pkgrel='1'
url='https://github.com/kennethreitz'
license=('custom:MIT')
arch=('any')
depends=('python-docopt' 'python-xerox')
source=("https://github.com/kennethreitz/em/archive/v${pkgver}.tar.gz")
sha512sums=('38463627c3cbf6f2194089af309c7aab626d13d9fa51b67a2be1b4fc392a1f6db40b6563fd6d7054f3b7a60229255a6915391c54ec81782cf45d655a9b627472')

package () {
	cd "em-${pkgver}"
	2to3 --nobackups --write --no-diffs em
	python3 setup.py install --optimize=1 --root="${pkgdir}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
