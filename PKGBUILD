# Maintainer: ⭐️NINIKA⭐️ <nikita6@bk.ru>
_build_rev=c849342e971fd3e491b123a855b9987e5f9ffcdf
pkgname=revng-bin
pkgver=0.0.0.gc849342e
pkgrel=1
pkgdesc="An open source binary analysis framework based on LLVM and QEMU"
arch=('x86_64')
url="https://rev.ng/"
license=('GPL2')
depends=()
makedepends=()
provides=('revng')
source=(
    "https://rev.ng/downloads/revng-distributable/none_${_build_rev}.tar.xz"
    "launcher.sh"
)
sha256sums=('631a351bebbedb0c655eec9c3514b609fcdcec88912f310d29d9929985eb476d'
            '4605f93ff27ba081036acebb204af5e81614394357d941ae917e8e97e58d7252')
options=("!strip")

pkgver() {
    echo "0.0.0.g$(echo "$_build_rev" | cut -c -8)"
}

package() {
    install -d -m755 "${pkgdir}/opt/revng" "${pkgdir}/usr/bin"

    cp -dr --no-preserve='ownership' "${srcdir}/revng-public-demo"/* "${pkgdir}/opt/revng"

    # not using a symlink because the "revng" script gets confused about its location
    install -m755 "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/revng"
}
