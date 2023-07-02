# Maintainer: achref ben mbarek <kaizakia6@gmail.com>

pkgname=sddm-terminal-inspired-theme-git
pkgver=1.0.0.r0.g257ac5c
pkgrel=1
pkgdesc="Custom theme for SDDM - Gorgeous and Simple Terminal-Like"
arch=('any')
url="https://github.com/achrefbenmbarek1/terminal-inspired-sddm-theme.git"
license=('GPL3')
depends=('sddm')
makedepends=('git')
md5sums=('SKIP')
source=("${pkgname}::git+${url}")

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/^[vV-]//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    chmod +x "${srcdir}/${pkgname}/sessionsDetector.sh"
    "${srcdir}/${pkgname}/sessionsDetector.sh"
}

package() {
    cd "${srcdir}/${pkgname}"
    install -d "${pkgdir}/usr/share/sddm/themes/terminal-inspired"
    cp -r * "${pkgdir}/usr/share/sddm/themes/terminal-inspired/"
}

