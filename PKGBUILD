# Maintainer: Sematre <sematre at gmx dot de>
pkgname=python-iso639-lang-0.0.9
pkgver=0.0.9
pkgrel=2

pkgdesc="A lightweight library for the ISO 639 standard. (v0.0.9)"
arch=('any')
url="https://github.com/LBeaudoux/iso639"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
conflicts=('python-iso639-lang')
source=("${pkgname}.tar.gz::https://files.pythonhosted.org/packages/ca/9d/36dd248b44bfcebbd63760a0ae262bf0ed15588b6238e3ef58b843dc533c/iso639-lang-0.0.9.tar.gz"
        "LICENSE.txt::https://raw.githubusercontent.com/LBeaudoux/iso639/2cbf05ac13d46a788332dee9ac935e76159794b8/LICENSE.txt")
sha256sums=('b5e1fba4ceac7afa6849f3f1f7350351b1420852674391ce18c208b2427f04c3'
            'ce30b156c415c0a229e8ecee2c562951688a73adcf89bcba54ddf969248a8d77')

build() {
	cd "iso639-lang-${pkgver}"
	python setup.py build
}

package() {
	cd "iso639-lang-${pkgver}"
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize 1 --skip-build

	cd "${srcdir}"
	install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
