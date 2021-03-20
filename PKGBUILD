# Maintainer: Zion Nimchuk <zionnimchuk@gmail.com>
pkgname=trex-bin
provides=('trex')
conflicts=('trex')
_cudaver=11.1
pkgver=0.19.12
pkgrel=1
pkgdesc="T-Rex is a versatile cryptocurrency mining software for NVIDIA hardware. It supports a variety of algorithms and is trying to do its best to make it as fast and as convenient to use as possible."
arch=('x86_64')
license=('custom')
url="https://github.com/trexminer/T-Rex"
options=('!strip')
depends=('nvidia-utils')
# For some reason the official GitHub Release doesn't work on Arch-based distros, so I'm using the file avialable from the dev here: 
# https://github.com/trexminer/T-Rex/issues/296#issuecomment-803103502
source=("t-rex_${pkgver}_${_cudaver}.tar.gz"::"https://www.dropbox.com/s/yiy5gq26ownzp01/t-rex-${pkgver}-new-linux-cuda${_cudaver}.tar.gz?dl=1")
sha512sums=('5d47725de7deb60405727287ee078c27a65cb2fd11790e6f432ed4dbc586f1b01bebbafb3811409bc9d3698aa84a34de9c7358bfe9dd6af57f84cd97e676f5ec')

package() {
    cd "${srcdir}"
    ls
    install -Dm755 "${srcdir}/t-rex" "${pkgdir}/usr/bin/t-rex"
}
