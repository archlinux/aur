# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com>

pkgname=adapta-kde-git
gitname=adapta-kde
pkgver=20170920
pkgrel=1
pkgdesc="Complete Adapta theme pack for KDE Plasma using Kvantum theme engine (git version)"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/adapta-kde"
license=('GPL3')
depends=('kwin' 'plasma-desktop' 'kvantum-qt5' 'papirus-icon-theme-git')
optdepends=('konsole: For the Konsole color scheme'
            'yakuake: For the Yakuake skin'
            'adapta-gtk-theme: Matching GTK theme')
makedepends=('git' 'make')
conflicts=('adapta-kde' 'adapta-aurorae-theme-git')
source=("git+https://github.com/PapirusDevelopmentTeam/${gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${gitname}"

  git log -1 --format="%cd" --date=short | tr -d '-'
  
}

 package() {
  make -C "${srcdir}/${gitname}" DESTDIR="${pkgdir}/" install
}

