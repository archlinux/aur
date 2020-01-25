# Maintainer: Nikos Skalkotos <skalkoto at gmail dot com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Dennis Værum <dennis.vaerum (at) gmail (dot) com> 
# Contributor: Achilleas Pipinellis <axilleas archlinux info>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Gökmen Görgen <gkmngrgn at gmail dot com>
# Contributor: Baurzhan Muftakhidinov <baurthefirst (at) gmail (dot) com>

_pkgname=pyparted
pkgbase=python-${_pkgname}
pkgname=(python-${_pkgname} python2-${_pkgname})
pkgver=3.11.3
pkgrel=1
pkgdesc="Python module for GNU parted"
url="https://github.com/rhinstaller/pyparted"
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('pkg-config' 'python' 'python2' 'parted>=3.0')
conflicts=('pyparted-git')
replaces=('pyparted')
source=("https://github.com/dcantrell/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('861869d286ddca64e536851a992608e5c9482f55a2978c93386a167e73d05effa3ad80495a9b81af6973ee6770b9d6ef693e133fe086073698e8e02aa5ee5931')

package_python-pyparted() {
  pkgdesc="Python module for GNU parted - python 3.x pkg"
  depends=('python' 'parted>=3.0')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-pyparted() {
  pkgdesc="Python module for GNU parted - python 2.x pkg"
  depends=('python2' 'parted>=3.0')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}

