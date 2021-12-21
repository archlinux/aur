# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=mongars
pkgver=0.1.4
pkgrel=1
pkgdesc="Count inbox emails using Gnome Online Accounts"
arch=('any')
url="https://github.com/chmouel/mongars"
license=('Apache')
depends=('python-gobject' 'evolution-data-server')
source=( https://github.com/chmouel/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz )
sha256sums=('09b5eee1ea4af7ec867e2b531587a75b01d8dc20424e3d98d8742423d835ab23')
makedepends=("python-setuptools")

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py build
}

package() { 
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py -q install --root="${pkgdir}" --optimize=1
}
