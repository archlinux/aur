# Maintainer: Johannes Jöns <johannes@joens.email>
pkgname=dracula-qtcreator-theme-git
pkgver=r27.898dbb5
pkgrel=1
pkgdesc="Dark theme for Qt Creator"
arch=(any)
url="https://github.com/dracula/qtcreator"
license=('MIT')
depends=('qtcreator')
makedepends=('git')
conflicts=(dracula-qtcreator-theme)
provides=(dracula-qtcreator-theme)
source=("git+https://github.com/dracula/qtcreator")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/qtcreator"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
    install -vDm644 -t "${pkgdir}"/usr/share/qtcreator/styles/ \
        ${srcdir}/qtcreator/dracula.xml
}
