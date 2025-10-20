# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Wu Junyu <wu.junyu.aur@outlook.com>
# Contributor: Michel Zou <xantares09@hotmail.com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr
# Contributor: Marti Raudsepp <marti@juffo.org>
_base=cython
pkgbase=pypy-${_base}
pkgname=pypy3-cython
pkgver=3.1.5
pkgrel=1
pkgdesc="C-Extensions for PyPy"
arch=(i686 x86_64)
url="https://${_base}.org"
license=(Apache-2.0)
makedepends=(pypy3-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('cff0cebd3b72b47f92a0bb8f77e564655a966ee58442b7fe76db2263b8b0d5b3636bfb0a561b1f27fd10cfd113e52388b32971bea66f4d2cb6dbf8580465b873')

package_pypy3-cython() {
  depends=(pypy3)

  cd "${srcdir}"/${_base}-${pkgver}
  pypy3 setup.py install --prefix=/opt/pypy3 --root="${pkgdir}" --optimize=1
  sed -i 's|#!.*python|#!/usr/bin/pypy3|' "${pkgdir}"/opt/pypy3/bin/*
}
