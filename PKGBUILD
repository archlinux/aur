# Maintainer: Sick Codes <info at sick dot codes>
# Maintainer: Christian Hoff <https://github.com/choff>
# Contributor: Tobias Martin <tm-x at gmx dot net>

_commit=2325d6fe45ef64fa94a8a05fcd75fc49e82e9dbb

pkgname=binder_linux-dkms
pkgver=6.0
pkgrel=1
arch=("x86_64")
url='https://github.com/choff/anbox-modules'
pkgdesc='Android kernel driver fork by @choff in DKMS format, binder only.'
license=("GPL3")
conflicts=("anbox-modules-dkms")
depends=("dkms")
makedepends=("git")
source=(
    "git+${url}.git#commit=${_commit}"
    "6.0-fix.diff")
sha256sums=('SKIP'
            'c8fc28dbaafca6b5e3e2dab5e75e194c73e43e825ed611b366885bc774b9885b')
prepare(){
    cd "${srcdir}/anbox-modules"
    git apply "${srcdir}/6.0-fix.diff"
}
package(){
    install -dm755 "${pkgdir}/usr/src/binder-1"
    cp -r "${srcdir}/anbox-modules/binder/"* "${pkgdir}/usr/src/binder-1/"
}
