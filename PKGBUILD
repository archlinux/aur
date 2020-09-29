# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Sebastien Leduc <sebastien@sleduc.fr>

_name='Google-Images-Search'
pkgname='python-google-images-search'
pkgver='1.3.3'
pkgrel='1'
pkgdesc="Search for image using Google Custom Search API and resize & crop the image afterwords"
arch=("any")
url="https://github.com/arrrlo/${_name}"
makedepends=('python' 'python-setuptools')
depends=('python-colorama' 'python-pyfiglet' 'python-termcolor' 'python-click' 'python-six'
	 'python-requests' 'python-pillow' 'python-resize-image' 'python-google-api-python-client')
license=('MIT')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('b658f191446471d4513b76fff152e7e4ae4f9a89bba4cee4c470f3081f896652')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
}
