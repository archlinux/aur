# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com

pkgname=adapta-aurorae-theme-git
gitname=adapta-kde
pkgver=20170913
pkgrel=1
pkgdesc="adapta decorations for Kwin (git version)"
arch=('x86_64')
url="https://github.com/PapirusDevelopmentTeam/adapta-kde"
license=('GPL')
depends=('kwin' 'kvantum-qt5')
makedepends=('git' 'make')
source=("git+https://github.com/PapirusDevelopmentTeam/adapta-kde.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${gitname}"

  git log -1 --format="%cd" --date=short | tr -d '-'
  
}

	package() {
	mkdir -p $pkgdir/usr/share/aurorae/themes
    mkdir -p $pkgdir/usr/share/Kvantum/Adapta
    cp -r "${srcdir}/${gitname}/aurorae/themes/Adapta" "$pkgdir/usr/share/aurorae/themes/"
    cp -r "${srcdir}/${gitname}/Kvantum/Adapta" "$pkgdir/usr/share/Kvantum/"
}
