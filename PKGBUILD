# $Id$
# Maintainer : Christian Rebischke <Chris.Rebischke@archlinux.org>
# Contributor:dront78 <dront78@gmail.com>
pkgname=systemtap
pkgver=3.1
pkgrel=3
pkgdesc="SystemTap provides free software (GPL) infrastructure to simplify the gathering of information about the running Linux system."
url="http://sourceware.org/systemtap/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('elfutils' 'nss' 'python2' 'texlive-fontsextra' 'texlive-latexextra' 'latex2html')
optdepends=('sqlite3')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceware.org/systemtap/ftp/releases/${pkgname}-${pkgver}.tar.gz")
sha512sums=('07b322d5745f570296e287db80f1e370da87eb65073815cf24d532827900453c1cb9ee74b5496b4f3919d176b960caad4479edc2dadf27b5c58898fb7398264d')
install='systemtap.install'

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

