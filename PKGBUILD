# Maintainer: Ryan Greenup <ryan.greenup @ protonmail dot com>

pkgname=cadmus-notes
pkgver=1.0
pkgrel=1
pkgdesc="Modular Shell Scripts for an MD Notebook"
arch=('x86_64')
url="ryangreenup.github.io/cadmus"
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
    sed
    grep
    jq
    pandoc
    ranger
    recode
    sd
    skim
    xclip
    iproute2
)
## These aren't in the official repos and could have
## been installed with cargo
optdepends=('nodejs-markserv: Preview Support'
            'tectonic: Additional option for PDF Export'
            'mdcat: Pretty Print'
            ## These are just optional
            'texlive-core: PDF Export'
            'wmctrl: Move Windows'
            'wl-clipboard: Clipboard for Wayland')


source=("git+https://github.com/RyanGreenup/cadmus.git#tag=1.0")
# source=("git+https://github.com/RyanGreenup/cadmus.git")
# source=("git+https://github.com/RyanGreenup/cadmus.git#branch=makepkg")
 sha256sums=('SKIP')

package() {
################################################################################
# If I wanted to actually install it by splitting up the binaries and resources
################################################################################

#  install -Dm755 "$srcdir/cadmus/bin/*" -t "${pkgdir}/usr/bin/"
#  install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
# install -d "${srcdir}/cadmus/" -Dt "${pkgdir}/$HOME/.cadmus"

################################################################################
# Using the portable philosphy that I've previously settled on
################################################################################

 mkdir -p "${pkgdir}/opt/.cadmus";
 mkdir -p "${pkgdir}/usr/bin";
 rsync -av ${srcdir}/cadmus/* "${pkgdir}/opt/cadmus/"
 ln -rsf "${pkgdir}/opt/cadmus/bin/cadmus" "${pkgdir}/usr/bin/cadmus"

}
