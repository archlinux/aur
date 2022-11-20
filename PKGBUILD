# Maintainer: Médéric Boquien <mboquien@free.fr>

pkgname=python-image-registration
pkgver=0.2.6
pkgrel=1
pkgdesc="A python module for registering astronomical images with extended emission"
arch=('any')
url="https://github.com/keflavich/image_registration"
license=("MIT")
depends=('python' 'python-astropy' 'python-matplotlib' 'python-scipy')
source=("https://files.pythonhosted.org/packages/source/i/image-registration/image_registration-${pkgver}.tar.gz")
sha512sums=('a95caba9e4f715fc538594f83a8ea5a6253f66d2c92bceecf4ac75708d20eb1cc03b92f2471fb60a0389ca8d54e1e6fe0aa2754801aa22f50318152620e2da9c')

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
