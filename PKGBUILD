# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-hanzidentifier
pkgver=1.0.2
pkgrel=1
pkgdesc='Python module that identifies Chinese text as being Simplified or Traditional'
arch=('any')
url="https://github.com/tsroten/hanzidentifier"
license=('MIT')
depends=('python-tox'
         'python-zhon')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tsroten/hanzidentifier/archive/v${pkgver}.tar.gz")
sha256sums=('e0bad67163c1b0cfd62a74da5dad6e692983ed9e4777e8ffc9081cb7a894ead6')

package() {
  cd "hanzidentifier-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}