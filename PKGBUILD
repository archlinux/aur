# Maintainer: Nils Steinger (voidptr.de)
pkgname=python-rubymarshal
_pkgname=rubymarshal
pkgver=1.0.3
pkgrel=1
pkgdesc='Read and write serialized data from the Ruby Marshal library'
url='https://github.com/d9pouces/RubyMarshal'
arch=('any')
license=('custom:WTFPL')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('df3c6b114637993adc5d3941c941f0d3')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

