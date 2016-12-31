# Maintainer: Aner Andros <code@anerandros.info>

pkgbase=git-it
pkgname=git-it
pkgrel=1
pkgver=4.2.2
pkgdesc="Git-it is a desktop app that teaches you how to use Git and GitHub on the command line."
url="https://github.com/jlord/git-it-electron"
provides=('git-it')
arch=('x86_64')
license=('BSD')
depends=('electron' 'git' 'atom')
makedepends=()
backup=()
install=''
source=(
    "https://github.com/jlord/git-it-electron/releases/download/${pkgver}/Git-it-Linux-x64.zip"
    "${pkgname}.desktop"
    "${pkgname}.png"
)
md5sums=('206f8fbf6a4fe9e5fb1bd93a08735e4a'
	 'd3591aa0a045fc1569eb00a4f6ebb26d'
	 '3fc4074dd6efa11246481d57dae86cf1')

package() {
    install -d "$pkgdir"/opt

    cp -R "$srcdir"/Git-it-linux-x64 "$pkgdir"/opt/Git-it-Linux-x64

    install -d "$pkgdir"/usr/bin
    ln -sf ../../opt/Git-it-Linux-x64/Git-it "$pkgdir"/usr/bin/git-it

    install -D -m644 "./${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m644 "./${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
