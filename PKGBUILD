# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmckgmail
pkgdesc="dockapp that checks mail in a gmail mailbox"
pkgver=1.1
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.dockapps.net/wmckgmail"
license=("GPL")
depends=('libxpm')
optdepends=('wget: to collect mail')
source=("http://www.dockapps.net/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('320616f0c4c936c60fa23e18125ea6ae')

prepare() {
  cd dockapps-*
  sed -i -e 's,INLINE inline,INLINE,;t' wmgeneral/list.h
}

build() {
  cd dockapps-*
  make
}

package() {
  cd dockapps-*
  install -Dm0755 ${pkgname}/${pkgname} "$pkgdir/usr/bin/${pkgname}"
  install -Dm0644 ${pkgname}/${pkgname}.1 "$pkgdir/usr/share/man/man1/${pkgname}.1"
}
