# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>

_repo_name=waydroid_script
_script=waydroid_extras.py
pkgname=waydroid-script-git
pkgver=r23.9a3b849
pkgrel=1
pkgdesc="Python Script to add OpenGapps, Magisk, libhoudini translation library and libndk translation library to waydroid"
arch=('any')
url="https://github.com/casualsnek/$_repo_name"
license=('GPL3')
makedepends=('git')
depends=('python-requests' 'python-tqdm' 'waydroid')
optdepends=()
provides=('waydroid-script')
conflicts=('waydroid-script')
source=("git+${url}.git")
md5sums=(SKIP)

prepare() {
    cd ${srcdir}/$_repo_name
    sed -i '1i#!/usr/bin/python' $_script
}

pkgver() {
    cd ${srcdir}/$_repo_name
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${srcdir}/$_repo_name
    install -d ${pkgdir}/usr/bin
    install -m755 $_script ${pkgdir}/usr/bin/waydroid-extras
}
