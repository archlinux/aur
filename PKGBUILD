# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail.com>
pkgname=howdoi
pkgver=1.2.1
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
sha512sums=('83af30118087105392ddb95b05d9e7442f5ee5df981faa9143770dedb8927c164a4f30f37ccd219a826340f0f8cd81fc5eb9a3b12e5d3956786294699b6e2f9b')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

