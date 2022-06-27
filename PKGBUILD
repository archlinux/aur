# Maintainer: pkg_maintainer <archlinuxpackagemaintainer@gmail.com>
pkgname=gtk-cyberpunk-neon-theme-git
pkgver=1.r16.1b442f6
pkgrel=1
epoch=
pkgdesc="GTK Cyberpunk Themes credit to Roboron3042 @github.com"
arch=('x86_64')
url="https://github.com/Roboron3042/Cyberpunk-Neon.git"
license=('CC-BY-SA 4.0')
groups=()
depends=(unzip)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(gtk-cyberpunk-neon-theme-git)
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
    cd Cyberpunk-Neon/gtk
    unzip materia-cyberpunk-neon.zip
    unzip oomox-cyberpunk-neon.zip
    mkdir -p ${pkgdir}/usr/share/themes/
    cp -rf oomox-cyberpunk-neon ${pkgdir}/usr/share/themes/
    cp -rf materia-cyberpunk-neon ${pkgdir}/usr/share/themes/
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    cd ..
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

