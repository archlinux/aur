# Maintainer: Aner Andros <code@anerandros.info>

pkgbase=git-it
pkgname=git-it
pkgrel=7
pkgver=4.3.3
pkgdesc="Desktop app that teaches you how to use Git and GitHub on the command line."
url="https://github.com/jlord/git-it-electron"
provides=('git-it')
arch=('x86_64')
license=('BSD')
depends=('gnuplot' 'libxtst' 'libxss' 'alsa-lib' 'nodejs' 'nss' 'gconf')
makedepends=()
backup=()
install=''

source=(
    "https://github.com/jlord/git-it-electron/releases/download/${pkgver}/Git-it-Linux-x64.zip"
    "${pkgname}.desktop"
    "${pkgname}.png"
)

md5sums=('aa5ebe86a547afa9bcc7ae8c25b02109'
	 'cc6162296991cdb4463081962c0018f1'
	 '3fc4074dd6efa11246481d57dae86cf1')

package() {
    install -d "$pkgdir"/opt

    cp -R "$srcdir"/Git-it-Linux-x64 "$pkgdir"/opt/git-it

    install -d "$pkgdir"/usr/bin
    ln -sf ../../opt/git-it/Git-it "$pkgdir"/usr/bin/git-it

    install -D -m644 "./${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m644 "./${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -D -m644 "${srcdir}/Git-it-Linux-x64/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
