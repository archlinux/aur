# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=lazagne
pkgver=2.4.3
pkgrel=1
pkgdesc='An open source application used to retrieve lots of passwords stored on a local computer'
arch=('any')
url="https://github.com/AlessandroZ/LaZagne"
license=('LGPL3')
depends=('python-psutil'
         'python-secretstorage'
         'python-pyasn1'
         'python-pycryptodome'
         'python-pypykatz'
         'python-rsa')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AlessandroZ/LaZagne/archive/${pkgver}.tar.gz")
sha256sums=('2057ec5697f44556dcc5d42321fa70244343859571f5ac98ad3e48a8ac44a90b')

package() {
  cd "LaZagne-${pkgver}"
  install -d "${pkgdir}/opt/"
  cp -R Linux "${pkgdir}/opt/LaZagne"
  install -d "${pkgdir}/usr/bin/"
  ln -s /opt/LaZagne/laZagne.py "${pkgdir}/usr/bin/lazagne"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 CHANGELOG -t "${pkgdir}/usr/share/doc/${pkgname}"
}