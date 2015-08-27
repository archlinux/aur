# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>

pkgbase=python-argcomplete
pkgname=('python-argcomplete' 'python2-argcomplete')
_pyname=argcomplete
pkgver=1.0.0
pkgrel=1
pkgdesc="easy, extensible command line tab completion of arguments for your Python script"
url="https://github.com/kislyuk/argcomplete"
arch=('any')
license=('Apache')
depends=('python')
makedepends=('python-distribute' 'python2-distribute')
source=(https://github.com/kislyuk/${_pyname}/archive/v${pkgver}.tar.gz)
sha512sums=('d14f214080738711fd664b92d406b8424dd9489ebcb1d58cdbc1df9aaa049dac8fea810e7d741d62db1e67d01991a16d6f006fb9c6898e5e65c709c1d8336353')

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
