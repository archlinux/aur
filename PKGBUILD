# Contributor: Thomas Haider <t.haider@vcnc.org>
# Maintainer: Christophe-Marie Duquesne <chmd@chmd.fr>
pkgname=gnome-keyring-query
pkgver=0.1
pkgrel=5
pkgdesc="Provides limited command-line access to the Gnome keyring"
arch=('i686' 'x86_64')
url="http://www.gentoo-wiki.info/HOWTO_Use_gnome-keyring_to_store_SSH_passphrases"
license=('custom')
depends=(gnome-keyring)
makedepends=(libgnome-keyring)
source=(gnome-keyring-query.c COPYING)
md5sums=('c3a6272c5c53a1d37e15c068f771dbb3'
         'f247d0bc021bcee8051ee84ccd12f514')

build() {
    cd "$srcdir"
    gcc `pkg-config --cflags --libs gnome-keyring-1 glib-2.0` -o gnome-keyring-query gnome-keyring-query.c
}

package() {
    install -D -m755 gnome-keyring-query $pkgdir/usr/bin/gnome-keyring-query
    install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
