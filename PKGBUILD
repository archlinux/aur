# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=mongars
pkgver=0.7.1
pkgrel=1
pkgdesc="Count inbox emails using Gnome Online Accounts"
arch=('any')
url="https://github.com/chmouel/mongars"
license=('Apache')
depends=('python-gobject' 'evolution-data-server')
source=( https://github.com/chmouel/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz )
sha256sums=('edfd9aa245aba16bca2f4d219343e55d7d331f5a7bc3cee2874e14dc15951b63')
makedepends=("python-setuptools")

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py build
}

package() { 
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py -q install --root="${pkgdir}" --optimize=1
}
