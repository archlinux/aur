# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=moondust-configpack-thextechsdk
pkgver=e45761a
pkgrel=1
pkgdesc="Moondust Project's game configuration pack - TheXTech SDK"
arch=('any')
url="https://github.com/Wohlstand/TheXTech-SDK"
license=('custom')
makedepends=('gawk' 'sed' 'curl')
depends=('thextech')
conflicts=('moondust-project-stable-bin')
provides=('moondust-configpack')
source=(
"git+$url.git"
)
sha512sums=(
"SKIP"
)

pkgver() {
    cd "$srcdir/TheXTech-SDK"
    git log -1 --pretty=format:"%h" --no-patch
}

package() {
    mkdir -p "${pkgdir}/opt/moondust/configs/"
    rm -rf "${srcdir}/TheXTech-SDK/.git"
    mv "${srcdir}/TheXTech-SDK" "${pkgdir}/opt/moondust/configs/TheXTech-SDK"
}
