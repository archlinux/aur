# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
pkgname=cdebootstrap-static
pkgver=0.5.10
pkgrel=2
pkgdesc="Bootstrap a Debian system"
arch=('i686' 'x86_64')
url="http://packages.debian.org/search?keywords=cdebootstrap"
license=('GPL')
depends=('wget' 'gnupg')
optdepends=('debian-archive-keyring')

if [[ $CARCH == x86_64 ]]; then
  source=(http://ftp.debian.org/debian/pool/main/c/cdebootstrap/${pkgname}_${pkgver}_amd64.deb)
  md5sums=('f300f68f31b0ce08c8017283d706a9f9')
elif [[ $CARCH == i686 ]] ; then
  source=(http://ftp.debian.org/debian/pool/main/c/cdebootstrap/${pkgname}_${pkgver}_i386.deb)
  md5sums=('f1a218d8d7982f5723531e1279bd1bb1')
fi

package() {
  tar xzvf ${srcdir}/data.tar.gz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
