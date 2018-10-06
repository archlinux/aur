# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com>

pkgname=adapta-kde-git
_gitname=adapta-kde
pkgver=r178.2255e46
pkgrel=1
pkgdesc="Complete Adapta theme pack for KDE Plasma using Kvantum theme engine (git version)"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/adapta-kde"
license=('GPL3')
depends=('kwin' 'plasma-desktop' 'kvantum-qt5' 'papirus-icon-theme')
optdepends=('konsole: For the Konsole color scheme'
            'yakuake: For the Yakuake skin'
            'adapta-gtk-theme: Matching GTK theme')
makedepends=('git' 'make')
conflicts=('adapta-kde' 'kvantum-theme-adapta' 'adapta-aurorae-theme-git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
   cd ${srcdir}/${_gitname}

   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
       
}

package() {
  make -C ${srcdir}/${_gitname} DESTDIR=${pkgdir}/ install
  
}

