# Maintainer: paperbenni <paperbenni@gmail.com>
_pkgname=instantfonts
pkgname=$_pkgname
pkgver=20205001
pkgrel=1
pkgdesc="patched fonts for instantOS"
arch=('any')
license=('MIT')
depends=('sh')
makedepends=('wget' 'git')
provides=(instantfonts)
conflicts=(instantfonts)

pkgver() {
    echo "$(date '+%Y%m%d%H%M')"
}

prepare() {
    mkdir -p $_pkgname
    cd $_pkgname
    echo "no prepare"
}

build() {
    cd $_pkgname
    echo "fetching fonts"
    wget -q "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete%20Mono.ttf"
    wget -q "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf"
}

package() {
    cd $_pkgname
    mkdir -p ${pkgdir}/usr/share/fonts/instantfonts
    chmod 644 *.ttf
    mv *.ttf ${pkgdir}/usr/share/fonts/instantfonts/
}
