# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Container: gbr <gbr@protonmail.com>

pkgname=vibrantlinux
pkgver=2.1.5
pkgrel=1
pkgdesc="A tool to automate managing your screen's saturation depending on what programs are running"
arch=(x86_64)
url="https://github.com/zee-mzha/vibrantLinux"
license=('MIT')
depends=("qt5-base" "libvibrant")
makedepends=("git")
source=("${pkgname}::git+https://github.com/zee-mzha/vibrantLinux.git#tag=v${pkgver}")
sha512sums=('SKIP')


build() {
    cd "${pkgname}"

    qmake
    make ${MAKEFLAGS}
}

package() {
    cd "${pkgname}"

    make INSTALL_ROOT="${pkgdir}" install

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
