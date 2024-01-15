# Maintainer: Sick Codes <info at sick dot codes>
# Maintainer: Christian Hoff <https://github.com/choff>
# Contributor: Tobias Martin <tm-x at gmx dot net>

_commit=13a93a4f7c17de5c5b9ab354aaf34b230583110e

pkgname=binder_linux-dkms
pkgver=6.7
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
)
sha256sums=('SKIP')
# prepare(){
#     cd "${srcdir}/anbox-modules"
#     for diff_file in "${srcdir}/"*.diff
#     do
#         git apply "$diff_file"
#     done
# }
package(){
    install -dm755 "${pkgdir}/usr/src/binder-1"
    cp -r "${srcdir}/anbox-modules/binder/"* "${pkgdir}/usr/src/binder-1/"
}
