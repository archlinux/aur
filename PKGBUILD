# Maintainer: Médéric Boquien <mboquien@free.fr>

pkgname=python-image-registration
pkgver=0.2.9
pkgrel=1
pkgdesc="A python module for registering astronomical images with extended emission"
arch=('any')
url="https://github.com/keflavich/image_registration"
license=("MIT")
depends=('python' 'python-astropy' 'python-matplotlib' 'python-scipy')
source=("https://files.pythonhosted.org/packages/source/i/image-registration/image_registration-${pkgver}.tar.gz")
sha512sums=('7b95cc144d78aecf24866de330f7d0ef0ec17ef66219fbec11ba8e4c1c2d6bf370aaa4752d393e6ee88a1486e16a05e14a6f66b0d23887d6734408d694743944')

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
