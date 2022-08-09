# Maintainer: pkg_maintainer <archlinuxpackagemaintainer@gmail.com>
pkgname=neon-browser-git
pkgver=0.r33.26f2fe6.BETA
pkgrel=1
epoch=
pkgdesc="A minimalistic web browser"
arch=('x86_64')
url="https://www.gitlab.com/NEON-MMD/neon-browser.git"
license=('GPL3')
groups=()
depends=(python-pyqt5 python-pyqt5-3d python-pyqt5-chart python-pyqt5-datavisualization python-pyqt5-networkauth python-pyqt5-purchasing python-pyqt5-webengine)
makedepends=(git)
checkdepends=()
optdepends=(privoxy)
provides=(neon-browser-git)
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd neon-browser
    printf "0.r%s.%s.BETA" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd neon-browser/src
    mkdir -p ${pkgdir}/opt/
    mkdir -p ${pkgdir}/etc/xdg/
    cp -rf modules/ ${pkgdir}/opt/
    cp -rf neonBrowser/ ${pkgdir}/etc/xdg/
    install -Dm755 neon-browser.py "${pkgdir}/usr/bin/neon-browser" 
    install -Dm644 ../README.org "${pkgdir}/usr/share/doc/${pkgname}/README.org"
    install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

