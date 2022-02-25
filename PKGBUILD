# Maintainer: Simon Hayessen <simon at lnqs dot io>

pkgname=python-obs-websocket
pkgver=0.5.3
pkgrel=1
pkgdesc="Python library to communicate with an obs-websocket server"
arch=(any)
url='https://github.com/Elektordi/obs-websocket-py'
license=('MIT')
depends=('python' 'python-six' 'python-websocket-client')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5992ca7f0c5205d55e893f4c27e53a8efca9478b073b86a19751de35308f3e98')

package() {
  cd obs-websocket-py-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

