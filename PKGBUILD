# Maintainer: Gleb Buzin <qufiwefefwoyn at gmail dot com>
# Contributor: Chinmay Dalal <w5vwg64uy@relay.firefox.com>

pkgname=fvim-bin
pkgver=0.3.531_g119a455
_pkgver=$(echo "${pkgver}" | sed -e "s/_/-/g")
pkgrel=1
pkgdesc="Cross platform Neovim front-end UI, built with F# + Avalonia"
arch=('x86_64')
url="https://github.com/yatli/fvim"
license=('MIT')
groups=()
depends=('neovim' 'ttf-dejavu')
makedepends=('rpmextract')
optdepends=()
provides=('fvim')
conflicts=('fvim')
source=("https://github.com/yatli/fvim/releases/download/v0.3.531%2Bg119a455/fvim-linux-x86_64-v0.3.531+g119a455.rpm")
arch=('x86_64')
options=('staticlibs')
sha256sums=('0b0fbbfa1c047eed1091791108d5206f71a36da95ca5ab55f7b5c55d0cf13fdc')

package() {
	cd $srcdir
        rpmextract.sh fvim-linux-x86_64-v0.3.531+g119a455.rpm
	cp -r "$srcdir/usr" "$pkgdir"
}
