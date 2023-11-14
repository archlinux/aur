# Maintainer: Giorgi Taba K'obakhidze <t@gtk.ge>

_name=linkpreview
pkgname=python-$_name
pkgver=0.8.1
pkgrel=1
pkgdesc='Get link preview in python'
arch=('any')
url=https://github.com/meyt/"$_name"
license=('MIT')
depends=('python-requests>=2.22.0' 'python-beautifulsoup4>=4.4.0')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('e16907d3f0f17a634998465397a22d31e2eecf9647bd781575a8016fc2876cb7')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
