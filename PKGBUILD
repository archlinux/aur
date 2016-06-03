# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-gtk-theme
_commit=dad8ab3 # 7 digits
pkgver=20160603
pkgrel=1
pkgdesc="Papirus color scheme for KDE "
url="https://github.com/PapirusDevelopmentTeam/${pkgname}"
arch=('i686' 'x86_64')
license=('GPL')
depends=('plasma-desktop' 'gtk2' 'gtk3' 'gtk-engine-murrine')
optdepends_x86_64=('lib32-gtk2' 'lib32-gtk3' 'lib32-gtk-engine-murrine')
makedepends=('git' 'make')
conflicts=('papirus-gtk-theme-git')
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
