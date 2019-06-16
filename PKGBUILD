# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail.com>
pkgname=howdoi
pkgver=1.2.0
pkgrel=1
pkgdesc="A code search tool."
arch=(any)
url="https://github.com/gleitz/howdoi"
license=(MIT)
depends=('python-pygments>=2.2.0'
         'python-argparse>=1.4.0'
         'python-cssselect>=1.0.3'
         'python-lxml>=4.2.5'
         'python-pyquery>=1.4.0'
         'python-requests>=2.20.1'
         'python-cachelib>=0.1'
         'python-appdirs>=1.4.3')
makedepends=(python python-setuptools)
changelog=Changelog
conflicts=(${pkgname}-git)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('f7362e4e8d46db90b1f99e624c59cf2f48362ea2b0c18ac70bb76e531d26d3ded3fb9332769844bbf95fa156e0007eebc5a979e208820e5b80e09d9a6298d2a4')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

