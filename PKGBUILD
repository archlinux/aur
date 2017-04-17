# Maintainer: Fedor Suchkov <f.suchkov@gmail.com>

pkgname=rpatool-git
pkgver=r11.fc78e81
pkgrel=1

pkgdesc="rpatool is a simple tool allowing you to create, modify and extract Ren'Py (renpy) Archive (.rpa/.rpi) files. Currently, only writing to RPAv2/RPAv3 archives is supported."
arch=('any')
url="https://github.com/Shizmob/rpatool"
license=('custom:WTFPL')

depends=('python2')
makedepends=('git')

source=('git://github.com/Shizmob/rpatool.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    install -Dm755 rpatool "${pkgdir}/usr/bin/rpatool"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/WTFPL.txt"
}
