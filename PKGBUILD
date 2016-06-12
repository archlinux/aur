# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>

pkgbase=python-argcomplete
pkgname=('python-argcomplete' 'python2-argcomplete')
_pyname=argcomplete
pkgver=1.4.0
pkgrel=1
pkgdesc="easy, extensible command line tab completion of arguments for your Python script"
url="https://github.com/kislyuk/argcomplete"
arch=('any')
license=('Apache')
makedepends=('python-distribute' 'python2-distribute')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/kislyuk/${_pyname}/archive/v${pkgver}.tar.gz)
sha512sums=('96cf379a4cb2d278fd3a317f8f2919db519e3a5b98e093b665f02c2f3b843bea91bce5fcc57115df64f3f596bb4fa3b1a23ad7a71e350d50389308323c403084')

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
