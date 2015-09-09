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
pkgver=3.10.7
pkgrel=1
pkgdesc="Python module for GNU parted"
url="https://github.com/rhinstaller/pyparted"
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('pkg-config' 'python' 'python2' 'parted>=3.0')
conflicts=('pyparted-git')
replaces=('pyparted')
source=("https://github.com/rhinstaller/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('c57fed2a8d04511b12891fd59b6dd6840439aada7e5ebeab14a56e6e4f201c249046ee87d9d25af1b3f02960994efb0a2973f25928a9df85d48bbd1bc196ab07')

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

