# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=pyinfra
pkgver=1.1.2
pkgrel=1
pkgdesc="pyinfra automates infrastructure super fast at massive scale"
arch=('any')
url="https://pyinfra.com/"
license=('MIT')
depends=("python" "python-gevent" "python-paramiko" "python-click" "python-colorama"
         "python-docopt" "python-jinja" "python-dateutil" "python-pywinrm" "python-configparser")
makedepends=('python-setuptools')
source=("https://github.com/Fizzadar/pyinfra/archive/v$pkgver.tar.gz")
sha256sums=('90e2b86606ce8adce3ffde1da586c32549c8514b2dd371c3fe04bab97f484bfd')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

