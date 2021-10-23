# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Dennis Fink <the_metalgamer@hackerspace.lu>

_pkgname=translitcodec
pkgbase=python2-${_pkgname}
pkgname=("python2-${_pkgname}" "python-${_pkgname}")
pkgver=0.7.0
pkgrel=1
pkgdesc="Unicode to 8-bit charset transliteration codec"
makedepends=('python2-setuptools' 'python-setuptools')
arch=('any')
url="https://github.com/claudep/translitcodec"
license=('MIT')
source=("${url}/archive/version-${pkgver}.tar.gz")
sha256sums=('4ac4f1dff1e512b8a1d1e399cc45651a8bc35b8b18b84d6dcb71d007c6dcb1b3')

prepare() {
  cd "${srcdir}/${_pkgname}-version-${pkgver}"
  sed -i '1s/^/# -*- coding: utf-8 -*-\n\n/' translitcodec/__init__.py
}

package_python2-translitcodec() {
  cd "${srcdir}/${_pkgname}-version-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_python-translitcodec() {
  cd "${srcdir}/${_pkgname}-version-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
