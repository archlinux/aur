# Maintainer: Konstantin Shalygin <k0ste@cn.ru>
# Contributor: Konstantin Shalygin <k0ste@cn.ru>

pkgname='yandex-tank'
pkgver='1.7.32'
pkgrel='1'
pkgdesc='Performance measurement tool'
arch=('any')
url="https://github.com/yandex/${pkgname}"
license=('GPL')
depends=('python2' 'python2-psutil' 'python2-ipaddr' 'python2-progressbar' 'python2-paramiko' 'python2-requests' 'python2-pyzmq' 'phantom')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1b6c2100b0c3e024ce44f52cac9b8262e5f710a414c194bdd4a9a53460a2e058')

build() {
  pushd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py build
  popd
}

package() {
  pushd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
  popd
}
