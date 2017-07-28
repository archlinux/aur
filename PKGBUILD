# Maintainer: Marcus Behrendt <marcus dot behrendt dot eightysix(in numbers) at bigbrothergoogle dot com

_name=quarter-tiling
pkgname=kwin-scripts-quarter-tiling-git
epoch=1
pkgver=r116.9ed708b
pkgrel=1
pkgdesc='Quarter Tiling Script for KWin (git version)'
arch=('any')
url='https://github.com/Jazqa/kwin-quarter-tiling'
license=('GPLv2')
makedepends=('git')
depends=(
  "kwin"
)

source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"
    install -d "${pkgdir}/usr/share/kwin/scripts/${_name}"
    cp -a ./{contents,metadata.desktop} "${pkgdir}/usr/share/kwin/scripts/${_name}"
    install -Dm644 metadata.desktop "${pkgdir}/usr/share/kservices5/kwin-script-quarter-tiling.desktop.desktop"
}
