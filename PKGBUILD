# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=bcnc
pkgver=0.9.14.304
pkgrel=1
pkgdesc="GRBL CNC command sender, autoleveler and g-code editor"
arch=('any')
url="https://github.com/vlachoudis/bCNC"
license=(GPL2)
depends=(python python-pyserial python-pillow tk)
source=("https://github.com/vlachoudis/bCNC/archive/${pkgver}.tar.gz"
        "bcnc.desktop")
md5sums=('387a49ac07b535b4002d30c6800971b6'
         'bfebf708ff377bcc6c2597b5e03e420e')

build() {
  cd "bCNC-${pkgver}"
  python setup.py build
}

package() {
  cd "bCNC-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -D -m644 "${srcdir}/bcnc.desktop" "${pkgdir}/usr/share/applications/bcnc.desktop"
  install -D -m644 "bCNC/bCNC.png" "${pkgdir}/usr/share/pixmaps/bcnc.png"
}
