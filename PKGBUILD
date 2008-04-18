# Maintainer: Roman Kyrylych <roman@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=gpgme
pkgver=1.1.6
pkgrel=1
pkgdesc="A C wrapper library for GnuPG."
arch=('i686' 'x86_64')
url="http://www.gnupg.org/related_software/gpgme/"
license=('GPL')
depends=('libgpg-error>=1.5' 'pth' 'gnupg' 'gnupg2')
source=(ftp://ftp.gnupg.org/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('df7ab717bf9b0189bd76b06c0c8a2509')
options=('!libtool')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
