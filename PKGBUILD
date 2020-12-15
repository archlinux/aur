# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=pyinfra
pkgver=1.3
pkgrel=1
pkgdesc="pyinfra automates infrastructure super fast at massive scale"
arch=('any')
url="https://pyinfra.com/"
license=('MIT')
depends=("python" "python-gevent" "python-paramiko" "python-click" "python-colorama"
         "python-docopt" "python-jinja" "python-dateutil" "python-pywinrm" "python-configparser")
makedepends=('python-setuptools')
source=("https://github.com/Fizzadar/pyinfra/archive/v$pkgver.tar.gz")
sha256sums=('0852337af2a82723c1502b81a1326e59bb1421ae4114242940b779508b8fbb06')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

