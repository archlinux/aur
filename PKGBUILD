# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname='oh-my-posh'
pkgname="${_pkgname}-bin"
pkgver=7.64.2
pkgrel=1
pkgdesc="A prompt theme engine for any shell."
arch=('x86_64')
url="https://github.com/JanDeDobbeleer/oh-my-posh"
license=('MIT')
makedepends=('curl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v$pkgver/posh-linux-amd64")
sha256sums=('df69959e48abfcab0010ea8100f535e15dccc1800ca43882224c5c13364cbc03')

pkgver() {
    curl --silent -L "https://api.github.com/repos/JanDeDobbeleer/oh-my-posh/releases/latest" | # Get latest release from GitHub api
        grep '"tag_name":' |                                                                    # Get tag line
        sed -E 's/.*"([^"]+)".*/\1/' |
        sed 's/v//'
}

package() {
    install -Dm 755 posh-linux-amd64 "${pkgdir}/usr/bin/oh-my-posh"
}
