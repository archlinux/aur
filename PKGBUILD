# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=pyinfra
pkgver=1.4.12
pkgrel=1
pkgdesc="pyinfra automates infrastructure super fast at massive scale"
arch=('any')
url="https://pyinfra.com/"
license=('MIT')
depends=("python" "python-gevent" "python-paramiko" "python-click" "python-colorama"
         "python-docopt" "python-jinja" "python-dateutil" "python-pywinrm" "python-configparser")
makedepends=('python-setuptools')
source=("https://github.com/Fizzadar/pyinfra/archive/v$pkgver.tar.gz")
sha256sums=('b7d7b7844c98a105065d683190c3d0723b4a1addde5a46f21938ead351ec8a65')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

