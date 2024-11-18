# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu, Zhenyu <wuzhenyu@ustc.edu>
_pkgname=distro-info
pkgname=python-$_pkgname
pkgver=1.12
pkgrel=1
pkgdesc="This package contains a Python 3 module for parsing the data in distro-info-data. There is also a command line interface in the distro-info package"
arch=(any)
url=https://code.launchpad.net/ubuntu/+source/distro-info
depends=(python distro-info-data)
makedepends=(python-installer)
license=(GPL3)
source=("http://http.debian.net/debian/pool/main/d/${_pkgname}/${_pkgname}_${pkgver}.tar.xz")
sha256sums=('63f1183be7df8dbae19fd4ba388a2aff0d040bb4b4a96a80e9851e8a4c885c09')

package() {
	cd "${_pkgname}/python" || return 1
	python setup.py install --root="$pkgdir" --optimize=1

}
