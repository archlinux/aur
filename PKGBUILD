# Maintainer: Yegorius <yegorius@domic.us>

pkgname=python2-zeroconf
_srcname=python-zeroconf
pkgver=0.17.4
pkgrel=1
pkgdesc="A pure python implementation of multicast DNS service discovery"
arch=('any')
url="https://github.com/jstasiak/python-zeroconf"
license=('LGPL')
depends=('python2' 'python2-netifaces' 'python2-six' 'python2-enum34')
makedepends=('python2-setuptools')
source=("https://github.com/jstasiak/${_srcname}/archive/${pkgver}.tar.gz")
sha256sums=('39ea7752c0032fe22d62f6d38415f7fbd981e43e70f3980a407178b67788ebd0')

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  # No need for enum-compat if depend on enum34
  sed -i "s/'enum-compat',//" setup.py
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

