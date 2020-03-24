# Maintainer: Clemens Hanel <clemens dot hanel at tngtech dot com>

pkgname=python-credstash-git
pkgver=1.16.1.3.g014d96b
pkgver=1.16.2.9.g97cc768
pkgrel=1
epoch=1
pkgdesc='A little utility for managing credentials in the cloud '
arch=('any')
url="https://github.com/fugue/credstash"
license=('Apache')
depends=('python-cryptography>=2.1' 'python-boto3>=1.1.1')
install="${pkgname}.install"
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${pkgname}
  local ver=$(git describe --tags --always | sed 's/-/./g')
  echo ${ver:1}
}

package() {
  cd ${srcdir}/${pkgname}
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"LICENSE
}

# vim:set ts=2 sw=2 et:
