# Maintainer: Nikos Skalkotos <skalkoto at gmail dot com>
# Contributor: Achilleas Pipinellis <axilleas archlinux info>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Gökmen Görgen <gkmngrgn at gmail dot com>
# Contributor: Baurzhan Muftakhidinov <baurthefirst (at) gmail (dot) com>

_pkgname=pyparted
pkgname=python2-pyparted
pkgver=3.10.3
pkgrel=1
pkgdesc="Python module for GNU parted"
url="https://github.com/rhinstaller/pyparted"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('python2' 'parted>=3.0')
makedepends=('pkg-config')
conflicts=('pyparted-git')
replaces=('pyparted')
source=("https://github.com/rhinstaller/${_pkgname}/archive/${_pkgname}-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
sha512sums=('238da222bb76e6838861f4fdff63f52823d0c7ace068fd4f40d5ccf5de5b7c26fadf52add689ec143755d568c52788b79262ba1090639560c3b54daa67e6507f')

