# Maintainer: pkg_maintainer <archlinuxpackagemaintainer@gmail.com>
pkgname=neon-os-scripts-git
pkgver=1.r19.1803739
pkgrel=1
epoch=
pkgdesc="My dmenu, zenity, etc scripts for my custom arch distro neon-os"
arch=('x86_64')
url="https://www.gitlab.com/NEON-MMD/neon-os-scripts.git"
license=('GPL3')
groups=()
depends=(zenity dmenu python aria2)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(neon-os-scripts-git)
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
	cd "${_pkgname}"
    printf "1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd neon-os-scripts
    mkdir -p ${pkgdir}/opt/${pkgname}
    mkdir -p ${pkgdir}/etc/neon-os/
    mkdir -p ${pkgdir}/etc/neon-os/.config/
    cp -rf amd-hybrid-switcher/* ${pkgdir}/opt/${pkgname}
    install -Dm755 usr-scripts/gpu-hybrid-switcher.sh "${pkgdir}/usr/bin/gpu-hybrid-switcher.sh"
    install -Dm755 usr-scripts/article-viewer-convertor.sh "${pkgdir}/usr/bin/article-viewer-convertor.sh"
    install -Dm755 usr-scripts/battery-notifier.sh "${pkgdir}/usr/bin/battery-notifier.sh"
    install -Dm755 usr-scripts/common-websites.sh "${pkgdir}/usr/bin/common-websites.sh"
    install -Dm755 usr-scripts/google-meet.sh "${pkgdir}/usr/bin/google-meet.sh"
    install -Dm755 usr-scripts/search-engines.py "${pkgdir}/usr/bin/search-engines.py"
    install -Dm755 usr-scripts/themes-changer.py "${pkgdir}/usr/bin/themes-changer.py"
    cp -rf script-dependencies/ ${pkgdir}/etc/neon-os/.config/
    install -Dm644 README.org "${pkgdir}/usr/share/doc/${pkgname}/README.org"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

