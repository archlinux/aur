# Maintainer: Marcus Behrendt <marcus dot behrendt dot eightysix(in numbers) at bigbrothergoogle dot com

pkgname=arc-kde-git
pkgver=20170112
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
    cd ${pkgbase}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
  cd ${srcdir}/${pkgbase}
  mkdir -p ${pkgdir}/usr/share

  cp --no-preserve=mode,ownership -r plasma ${pkgdir}/usr/share
  cp --no-preserve=mode,ownership -r aurorae ${pkgdir}/usr/share
  cp --no-preserve=mode,ownership -r Kvantum ${pkgdir}/usr/share
  cp --no-preserve=mode,ownership -r color-schemes ${pkgdir}/usr/share
  cp --no-preserve=mode,ownership -r konsole ${pkgdir}/usr/share
  cp --no-preserve=mode,ownership -r konversation ${pkgdir}/usr/share
  cp --no-preserve=mode,ownership -r wallpapers ${pkgdir}/usr/share
  cp --no-preserve=mode,ownership -r yakuake ${pkgdir}/usr/share
  mv ${pkgdir}/usr/share/yakuake/{kns_skins,skins}
}
