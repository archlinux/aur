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
pkgver=3.11.1
pkgrel=1
pkgdesc="Python module for GNU parted"
url="https://github.com/rhinstaller/pyparted"
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('pkg-config' 'python' 'python2' 'parted>=3.0')
conflicts=('pyparted-git')
replaces=('pyparted')
source=("https://github.com/dcantrell/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('4fe627693db803a82cacb37be8f2bee3527ee8d0d564229d7328a4e5c8dfa7cdd7a06c328ac7fa6b07c8f0c74d5db304410eaf312a60a0d494525d32c873fefd')

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

