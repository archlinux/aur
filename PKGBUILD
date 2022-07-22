# Maintainer: Médéric Boquien <mboquien@free.fr>

pkgname=python-image-registration
pkgver=0.2.5
pkgrel=1
pkgdesc="A python module for registering astronomical images with extended emission"
arch=('any')
url="https://github.com/keflavich/image_registration"
license=("MIT")
depends=('python' 'python-astropy' 'python-matplotlib' 'python-scipy')
source=("https://files.pythonhosted.org/packages/source/i/image-registration/image_registration-${pkgver}.tar.gz")
sha512sums=('09ae1419ad6cc3cfac9c848cb1eaf79e43aa7aeac67df7b7fe84a1783665febb674bae80b3013f1985d3c01ed0669f76128e25e0b7e5fc22b420a4537466894d')

build() {
  cd ${srcdir}/image_registration-${pkgver}

  python setup.py build
}

package() {
  cd ${srcdir}/image_registration-${pkgver}

  install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
  python setup.py install --root=${pkgdir}  --prefix=/usr --optimize=1
}
