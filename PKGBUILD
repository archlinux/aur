pkgname="lin-guider"
pkgver=5.0.1
pkgrel=1
pkgdesc="astronomical autoguiding program"
arch=("x86_64")
url='https://sourceforge.net/projects/linguider/'
license=('GPL3')
source=("https://altushost-swe.dl.sourceforge.net/project/linguider/${pkgver}/lin_guider-${pkgver}.tar.bz2")
sha256sums=('e0a21c7b009cbf7b617f4231fdb03a7f581b5c5306e5c6e1ca23e8b6dc62f4fd')

build() {
    cd "${srcdir}/lin_guider_pack/lin_guider"
    ./build.sh
}

package() {
    install -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/lin_guider_pack/lin_guider/build/release/lin_guider" "${pkgdir}/opt/${pkgname}/"
}
