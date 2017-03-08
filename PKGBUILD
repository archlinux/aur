# Maintainer: Marcus Behrendt <marcus dot behrendt dot eightysix(in numbers) at bigbrothergoogle dot com

pkgname=arc-kde-git
pkgver=20170306
pkgrel=1
pkgdesc='Arc customization mainly for Plasma 5 (git version)'
arch=('any')
url='https://github.com/PapirusDevelopmentTeam/arc-kde'
license=('GPLv3')
options=('!strip')
makedepends=('git')
optdepends=(
  "plasma-desktop: For Plasma desktop theme"
  "gtk-theme-arc-git: A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell (git version)"
  "arc-firefox-theme-git: Arc Firefox theme (git version)"
  "kwin: For Aurorae decorations"
  "qt4-style-kvantum-svn: For Kvantum Theme"
  "qt5-style-kvantum-svn: For Kvantum Theme"
  "kvantum-tools-qt5-svn: For Kvantum Theme"
  "konsole: For Konsole color schemes"
  "konversation: For konversation theme"
  "yakuake: For Yakuake theme"
)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
install=${pkgname}.install

pkgver(){
    cd ${pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    cd "${pkgname}"
    make DESTDIR="${pkgdir}" install
}
