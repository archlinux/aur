# Maintainer: Konstantin Shalygin <k0ste@cn.ru>
# Contributor: Konstantin Shalygin <k0ste@cn.ru>

_tank='yandextank'
pkgname='yandex-tank'
pkgver='1.7.30'
pkgrel='1'
pkgdesc='Performance measurement tool'
arch=('any')
url="https://github.com/yandex/${pkgname}"
license=('GPL')
depends=('python2' 'python2-psutil' 'python2-ipaddr' 'python2-progressbar' 'python2-paramiko' 'python2-requests' 'python2-pyzmq' 'phantom')
source=("https://pypi.python.org/packages/source/y/${_tank}/${_tank}-${pkgver}.tar.gz")
sha256sums=('801461ee7946874353db24a982203019772c88e088d15e2889cfe2c4cf4be9f5')

build() {
  pushd "${srcdir}/${_tank}-${pkgver}"
  python2 setup.py build
  popd
}

package() {
  pushd "${srcdir}/${_tank}-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
  popd
}
