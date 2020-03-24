# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=joeyespo-grip
pkgver=4.5.2
pkgrel=1
pkgdesc="Preview GitHub Markdown files like Readme locally before committing them"
arch=('any')
url='https://github.com/joeyespo/grip'
license=('MIT')
depends=('python-pygments'
		 'python-docopt'
		 'python-requests'
		 'python-flask'
		 'python-markdown'
		 'python-path-and-address')
makedepends=('python-setuptools')
source=("https://github.com/joeyespo/grip/archive/v${pkgver}.tar.gz")
md5sums=('6ac9163292e74eb6e2f0c2806b8e92e6')

build() {
  cd ${srcdir}/grip-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/grip-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}