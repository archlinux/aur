# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-kvantum-theme
_commit=edb8a42 # 7 digits
pkgver=20160612
pkgrel=1
pkgdesc="Papirus theme for Kvantum theme engine"
url="https://github.com/PapirusDevelopmentTeam/${pkgname}"
arch=('any')
license=('GPL')
depends=(qt{4,5}-style-kvantum-svn kvantum-tools-qt5-svn)
makedepends=('git' 'make')
conflicts=(${pkgname}-git)
options=('!strip')
source=("${pkgname}::git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    cd ${pkgname}
    make install DESTDIR="$pkgdir"
}
