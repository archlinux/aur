# Maintainer: Ke Liu <spcter119@gmail.com>

pkgname=python-language-tags
pkgver=0.4.6
pkgrel=1
pkgdesc='Dealing with IANA language tags in Python.'
arch=('any')
url='https://pypi.org/project/language-tags'
license=('MIT')
depends=('python-six')
_pkgname=language_tags
source=("https://files.pythonhosted.org/packages/source/l/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/OnroerendErfgoed/language-tags/master/LICENSE")
md5sums=('bff3d91f77be9c5ec587e54efafc859e'
         'SKIP')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py clean --all
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root "$pkgdir"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
