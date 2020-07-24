# Maintainer: Ryan Greenup <ryan.greenup @ protonmail dot com>

pkgname=cadmus-notes
pkgver=1.0
pkgrel=1
pkgdesc="Modular Shell Scripts for an MD Notebook"
arch=('x86_64')
url="https://ryangreenup.github.io/cadmus"
license=('GPL3')
provides=('cadmus')
makedepends=(git)
depends=(
    recoll
    tmsu
    ripgrep
    fd
    nodejs
    bat
    coreutils
    jq
    wmctrl
    pandoc
    ranger
    recode
    sd
    skim
    xclip
)
optdepends=('nodejs-markserv: Preview Support'
            'tectonic: Additional option for PDF Export'
            'mdcat: Pretty Print'
            'texlive-core: PDF Export'
            'wmctrl: Move Windows'
            'wl-clipboard: Clipboard for Wayland')


source=("https://github.com/RyanGreenup/cadmus/releases/download/${pkgver}/cadmus.tar.xz")
 sha256sums=('370d6ef60507aeaa8dfbc53e704bafa068df14cc891d5d700750be3e072b1d4d')

package() {
 mkdir -p "${pkgdir}/opt/cadmus";
 mkdir -p "${pkgdir}/usr/bin";
 rsync -av ${srcdir}/cadmus/* "${pkgdir}/opt/cadmus/"
 ln -rsf "${pkgdir}/opt/cadmus/bin/cadmus" "${pkgdir}/usr/bin/cadmus"
}
