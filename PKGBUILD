# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>

pkgbase=python-argcomplete
pkgname=('python-argcomplete' 'python2-argcomplete')
_pyname=argcomplete
pkgver=1.3.0
pkgrel=1
pkgdesc="easy, extensible command line tab completion of arguments for your Python script"
url="https://github.com/kislyuk/argcomplete"
arch=('any')
license=('Apache')
makedepends=('python-distribute' 'python2-distribute')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/kislyuk/${_pyname}/archive/v${pkgver}.tar.gz)
sha512sums=('16e195249ef0d2c81a92fc6dae7ab8a4527a889394ed0324e90e9179f66ce924e29dfbe3b3ac6c57c34420d5b6c43134a098aba73643df9a851eecae2dcae5b1')

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
