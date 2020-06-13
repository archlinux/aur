# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname='pyinfra'
pkgver=0.14.5
pkgrel=1
pkgdesc="pyinfra automates infrastructure super fast at massive scale"
arch=('any')
url="https://pyinfra.com/"
license=('MIT')
depends=("python" "python-gevent" "python-paramiko" "python-click" "python-colorama" "python-docopt" "python-jinja" "python-dateutil" "python-pywinrm")
makedepends=('python-setuptools')
source=("https://github.com/Fizzadar/pyinfra/archive/v$pkgver.tar.gz")
sha256sums=('f878200bf70fc758fd7fc954c3e1eb90b4badabc898d1725b6bec97d5a0ec4f8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

