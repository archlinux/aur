# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>

pkgbase=python-argcomplete
pkgname=('python-argcomplete' 'python2-argcomplete')
_pyname=argcomplete
pkgver=1.1.1
pkgrel=1
pkgdesc="easy, extensible command line tab completion of arguments for your Python script"
url="https://github.com/kislyuk/argcomplete"
arch=('any')
license=('Apache')
depends=('python')
makedepends=('python-distribute' 'python2-distribute')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/kislyuk/${_pyname}/archive/v${pkgver}.tar.gz)
sha512sums=('9908bc16e9df991342a82440e8cc377bf232b81ded1b348572eed42fa851e605d44feedc0e06cae4865a0eecba5753567a9434e9012bc61653bb0f1c6fd5d77c')

package_python-argcomplete() {
  depends=('python')
  cd ${_pyname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}"
}

package_python2-argcomplete() {
  depends=('python2')
  cd ${_pyname}-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}"
  mv "${pkgdir}/usr/bin/activate-global-python-argcomplete" \
    "${pkgdir}/usr/bin/activate-global-python2-argcomplete"
  mv "${pkgdir}/usr/bin/python-argcomplete-check-easy-install-script" \
    "${pkgdir}/usr/bin/python2-argcomplete-check-easy-install-script"
  mv "${pkgdir}/usr/bin/register-python-argcomplete" \
    "${pkgdir}/usr/bin/register-python2-argcomplete"
}

# vim: ts=2 sw=2 et:
