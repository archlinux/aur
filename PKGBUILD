# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
# Maintainer: huamnbeing27 <electronneutrino27@proton.me>
_repo_name=waydroid_script
_script=waydroid_extras.py
pkgname='waydroid-script'
pkgver=23.0104
pkgrel=2
license=('GPL3')
depends=('python-tqdm' 'python-requests' 'lzip' 'sqlite' 'waydroid')
arch=('any')
pkgdesc="Python Script to add OpenGapps, Widevine, Magisk, libhoudini translation library and libndk translation library to waydroid !"
url="https://github.com/casualsnek/$_repo_name"
provides=('waydroid-script-git')
conflicts=('waydroid-script-git')
source=($url/archive/refs/heads/main.zip)
sha512sums=('059ee969446ac83e0cda92fc9e82b1f4b790b6d2cb8e173fe9f98a4de3e5dd7bebc9caeb12c68dff0bb485848e0fda041a3a92fce964ecf34d834258433af4ba')
prepare(){
    cd ${srcdir}/$_repo_name-main
    sed -i '1i#!/usr/bin/env python3.10' $_script
}
package(){
    cd ${srcdir}/$_repo_name-main
    install -d ${pkgdir}/usr/bin
    install -m755 $_script ${pkgdir}/usr/bin/waydroid-extras
}
