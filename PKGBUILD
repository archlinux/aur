# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
pkgname=cdebootstrap-static
pkgver=0.6.4
pkgrel=1
pkgdesc="Bootstrap a Debian system"
arch=('i686' 'x86_64')
url="http://packages.debian.org/search?keywords=cdebootstrap"
license=('GPL')
depends=('wget' 'gnupg')
optdepends=('debian-archive-keyring')

if [[ $CARCH == x86_64 ]]; then
  source=(http://ftp.debian.org/debian/pool/main/c/cdebootstrap/${pkgname}_${pkgver}_amd64.deb)
  md5sums=('2478dd2f431055878f587c665226a68a')
elif [[ $CARCH == i686 ]] ; then
  source=(http://ftp.debian.org/debian/pool/main/c/cdebootstrap/${pkgname}_${pkgver}_i386.deb)
  md5sums=('9b8913af8576ba864809428bb43da3ce')
fi

package() {
  tar xJvf ${srcdir}/data.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
