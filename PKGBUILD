# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=moondust-configpack-thextechsdk-git
pkgver=v1.3.6.3.r8.g14f4519
pkgrel=1
pkgdesc="Moondust Project's game configuration pack - TheXTech SDK"
arch=('any')
url="https://github.com/Wohlstand/TheXTech-SDK"
license=('custom')
makedepends=('git' 'gawk' 'sed' 'curl')
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
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
package() {
    mkdir -p "${pkgdir}/opt/moondust/configs/"
    rm -rf "${srcdir}/TheXTech-SDK/.git"
    mv "${srcdir}/TheXTech-SDK" "${pkgdir}/opt/moondust/configs/TheXTech-SDK"
}
