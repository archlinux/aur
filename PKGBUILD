# Maintainer: Morten Linderud <morten@linderud.pw>

pkgbase=python-vagrant
pkgname=('python-vagrant' 'python2-vagrant')
pkgver=0.5.15
pkgrel=2
pkgdesc="Python bindings for interacting with Vagrant virtual machines."
url="https://github.com/todddeluca/python-vagrant"
license=('MIT')
arch=('any')
makedepends=('python' 'python-setuptools'
             'python2' 'python2-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/todddeluca/python-vagrant/archive/${pkgver}.tar.gz")
sha256sums=('36fd611b483ec8e5c23807910e3043440a4204527d4d98573993bf856da782ce')


build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py build
  python2 setup.py build
}

package_python-vagrant() {
  depends=('python')
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-vagrant() {
  depends=('python2')
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# vim:set ft=sh ts=2 sw=2 et:
