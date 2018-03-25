# Maintainer: ZaZam <zazaamm æt gmail døt com>
# Contributor: Yegorius <yegorius@domic.us>

pkgname=python2-zeroconf
_srcname=python-zeroconf
pkgver=0.19.1
pkgrel=2
pkgdesc="A pure python implementation of multicast DNS service discovery"
arch=('any')
url="https://github.com/jstasiak/python-zeroconf"
license=('LGPL')
depends=('python2' 'python2-netifaces' 'python2-six' 'python2-enum34')
makedepends=('python2-setuptools')
source=("https://github.com/jstasiak/${_srcname}/archive/${pkgver}.tar.gz")
sha256sums=('ca8952a3eb04818dcb566e1344f2f15b5dd6d487770384651cdfae777d5eb848')

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  # No need for enum-compat if depend on enum34
  sed -i "s/'enum-compat',//" setup.py
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

