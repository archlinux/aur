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
pkgver=3.10.3
pkgrel=2
pkgdesc="Python module for GNU parted"
url="https://github.com/rhinstaller/pyparted"
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('pkg-config' 'python' 'python2' 'parted>=3.0')
conflicts=('pyparted-git')
replaces=('pyparted')
source=("https://github.com/rhinstaller/${_pkgname}/archive/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('238da222bb76e6838861f4fdff63f52823d0c7ace068fd4f40d5ccf5de5b7c26fadf52add689ec143755d568c52788b79262ba1090639560c3b54daa67e6507f')

package_python-pyparted() {
  pkgdesc="Python module for GNU parted - python 3.x pkg"
  depends=('python' 'parted>=3.0')

  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-pyparted() {
  pkgdesc="Python module for GNU parted - python 2.x pkg"
  depends=('python2' 'parted>=3.0')

  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"
  python2 setup.py build
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}

