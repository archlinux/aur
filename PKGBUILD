# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=adapta-kde-wallpapers-git
pkgver=r104.2d22597
pkgrel=1
pkgdesc='Adapta KDE wallpapers'
arch=('any')
url='https://github.com/PapirusDevelopmentTeam/adapta-kde'
license=('CCPL')
makedepends=('git')
options=('!strip')
conflicts=('adapta-kde-wallpapers' 'adapta-kde-git')
provides=('adapta-kde-wallpapers')
source=('git://github.com/PapirusDevelopmentTeam/adapta-kde.git')
sha512sums=('SKIP')

pkgver() {
  cd adapta-kde
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd adapta-kde
  install -Dm644 wallpapers/Adapta/LICENSE ${pkgdir}/usr/share/licenses/adapta-kde-wallpapers-git/LICENSE
  rm wallpapers/Adapta/{AUTHORS,LICENSE}
  cp -r wallpapers ${pkgdir}/usr/share
}
