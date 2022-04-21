# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname='oh-my-posh'
pkgname="${_pkgname}-bin"
pkgver=7.67.0
pkgrel=1
pkgdesc="A prompt theme engine for any shell."
arch=('x86_64')
url="https://github.com/JanDeDobbeleer/oh-my-posh"
license=('MIT')
makedepends=('curl' 'grep' 'sed')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v$pkgver/posh-linux-amd64")
sha256sums=('aeb46c8074de88338bb9061df80d50d780972ef088835bc439b616be2dab58df')

pkgver() {
    curl --silent -L "https://api.github.com/repos/JanDeDobbeleer/oh-my-posh/releases/latest" | # Get latest release from GitHub api
        grep '"tag_name":' |                                                                    # Get tag line
        sed -E 's/.*"([^"]+)".*/\1/' |
        sed 's/v//'
}

package() {
    install -Dm 755 posh-linux-amd64 "${pkgdir}/usr/bin/oh-my-posh"
}
