# Maintainer: Sick Codes <info at sick dot codes>
# Maintainer: Christian Hoff <https://github.com/choff>
# Contributor: Tobias Martin <tm-x at gmx dot net>

_commit=205c8037e61d4546d8c86c1f789cfaf18fa9bc24

pkgname=binder_linux-dkms
pkgver=6.6
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
    "https://github.com/choff/anbox-modules/pull/12.diff"
)
sha256sums=('SKIP'
            '6964cc4c070a34bbed1a5e4249c1a2928f05c94716adfd0c79c410266ee4d0fd')
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
