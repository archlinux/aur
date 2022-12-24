# Maintainer: Sick Codes <info at sick dot codes>
# Maintainer: Christian Hoff <https://github.com/choff>
# Contributor: Tobias Martin <tm-x at gmx dot net>

_commit=cd66055f6d806d7f1534f38ff7142c75f6735e09

pkgname=binder_linux-dkms
pkgver=6.1
pkgrel=2
arch=("x86_64")
url='https://github.com/choff/anbox-modules'
pkgdesc='Android kernel driver fork by @choff in DKMS format, binder only.'
license=("GPL3")
conflicts=("anbox-modules-dkms")
depends=("dkms")
makedepends=("git")
source=(
    "git+${url}.git#commit=${_commit}"
    "6.1-fix.diff")
sha256sums=('SKIP'
            '46331ef50b05db9313c826e5f0d3cf7a65a8f1fc5908bb7cae191cd6ef308b70')
prepare(){
    cd "${srcdir}/anbox-modules"
    git apply "${srcdir}/6.1-fix.diff"
}
package(){
    install -dm755 "${pkgdir}/usr/src/binder-1"
    cp -r "${srcdir}/anbox-modules/binder/"* "${pkgdir}/usr/src/binder-1/"
}
