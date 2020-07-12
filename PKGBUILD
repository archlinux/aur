# Maintainer: Matthew Murray <matt@mattmurr.xyz>
pkgname=python-validity
pkgver=0.4
pkgrel=1
pkgdesc="Validity fingerprint sensor driver"
arch=(any)
license=(MIT)
depends=(python python-pyusb python-cryptography python-dbus python-gobject 
  innoextract open-fprintd fprintd-clients)
makedepends=(python-setuptools)
conflicts=($pkgname)
provides=($pkgname)
url="https://github.com/uunicorn/${pkgname}"
source=("${url}/archive/${pkgver}.tar.gz"
  python-validity.service)
md5sums=('76c176a317946f0fee6a7c7214607695'
         '41bda3076126b2465eb3cc6dafe14385')

build() {
  cd $srcdir/$pkgname
  python setup.py build
}

package() {
  cd $srcdir/$pkgname
  python setup.py install --prefix=/usr --root $pkgdir || return 1
}

# vim:set ts=2 sw=2 et:
