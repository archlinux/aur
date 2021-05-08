# Maintainer: Thomas Bächler <thomas@archlinux.org>
pkgname=joe
pkgver=4.6
pkgrel=2
pkgdesc="Joe's own editor"
arch=('x86_64')
url="https://joe-editor.sourceforge.io/"
license=('GPL')
depends=('ncurses')
optdepends=('gpm: console mouse support')
backup=('etc/joe/ftyperc' 'etc/joe/jicerc.ru' 'etc/joe/jmacsrc'
        'etc/joe/joerc' 'etc/joe/jpicorc' 'etc/joe/jstarrc' 'etc/joe/rjoerc')
source=("https://downloads.sourceforge.net/joe-editor/${pkgname}-${pkgver}.tar.gz")
sha256sums=('495a0a61f26404070fe8a719d80406dc7f337623788e445b92a9f6de512ab9de')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}/" install
}
