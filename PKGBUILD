# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-hug-middleware-cors
pkgver=1.0.0
pkgrel=1
pkgdesc='A hug middleware for allowing CORS (cross-origin resource sharing) requests from hug servers'
arch=('any')
url='https://github.com/sseemayer/hug_middleware_cors'
license=('MIT')
depends=('python-hug')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/6f/27/eb58db0af6121b1a6f2ec04e7a98a33801fd79613bf540a2c808ba90761d/hug_middleware_cors-${pkgver}.tar.gz"
        'README.md::https://github.com/sseemayer/hug_middleware_cors/raw/master/README.md'
        'LICENSE::https://github.com/sseemayer/hug_middleware_cors/raw/master/LICENSE')
sha256sums=('96222e06db1a2748ec0ef0f51da2165faf59c69f40593a639c3f72e0b2375a58'
            '2817e928e2f25d166d715d93d3af6029f1a421505d4400219af9e7f8e1de2d24'
            '29d4826a14875fe511e1ad6b8cee291c0d00f77c3611002661f40f1d57a45891')

package() {
  cd "hug_middleware_cors-${pkgver}"
  ln -s "${srcdir}/README.md" .
  ln -s "${srcdir}/LICENSE" .
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}