# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname='oh-my-posh'
pkgname="${_pkgname}-bin"
pkgver=7.59.2
pkgrel=1
pkgdesc="A prompt theme engine for any shell."
arch=('x86_64')
url="https://github.com/JanDeDobbeleer/oh-my-posh"
license=('MIT')
makedepends=('curl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v$pkgver/posh-linux-amd64")
sha256sums=('8246448b5ae62a8d8a5eefe51b3340573ba1418c4b98b7d461998077a217de5f')

pkgver() {
    curl --silent -L "https://api.github.com/repos/JanDeDobbeleer/oh-my-posh/releases/latest" | # Get latest release from GitHub api
        grep '"tag_name":' |                                                                    # Get tag line
        sed -E 's/.*"([^"]+)".*/\1/' |
        sed 's/v//'
}

package() {
    install -Dm 755 posh-linux-amd64 "${pkgdir}/usr/bin/oh-my-posh"
}
