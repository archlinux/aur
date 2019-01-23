# Maintainer: nano thirteen <nano13@gmx.net>

_pkgname=('jannal')
pkgname=('jannal-git')
pkgver=55
pkgrel=1
pkgdesc='A desktop-software for creating presentations like prezi and a mindmapping tool -- early alpha'
arch=('any')
licence=('gpl')
url='https://tambi-soft.github.io'
makedepends=('git')
depends=('qt5-base')
source=(${_pkgname}::git+https://github.com/tambi-soft/jannal.git)
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir"/"$_pkgname"
    qmake-qt5 -o Makefile jannal.pro
    make
    make clean
}

package() {
    install -D -m 755 ${srcdir}/${_pkgname}/debug/jannal ${pkgdir}/usr/bin/jannal
#    install -D -m 644 ${srcdir}/${_pkgname}/assets/logo.ico ${pkgdir}/usr/share/icons/hicolor/128x128/apps/kulanday_logo.ico
#    install -D -m 644 ${srcdir}/${_pkgname}/assets/kulanday.desktop ${pkgdir}/usr/share/applications/kulanday.desktop
}
