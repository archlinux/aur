# Maintainer: David McInnis <dave@dave3.xyz>
# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: djgera
# Contributor: Patrick Melo <patrick@patrickmelo.eti.br>

pkgname=geany-plugins-nowebkitgtk
_downloadname=geany-plugins
pkgver=1.30
pkgrel=2
pkgdesc='Geany plugins, minus geanypy'
arch=('x86_64' 'i686')
url='http://plugins.geany.org/'
license=('GPL')
depends=("geany>=$pkgver" 'gtkspell' 'ctpl' 'gpgme' 'vte' 'libsoup'
         'desktop-file-utils' 'gtk-update-icon-cache' 'lua51' 'libgit2')
makedepends=('intltool' 'vala' 'gdb' 'cppcheck' 'libgit2' 'perl-xml-parser')
optdepends=('hspell: hebrew spell checker')
provides=('geany-plugins')
replaces=('geany-plugins')
conflicts=('geany-plugins')
source=("http://plugins.geany.org/$_downloadname/$_downloadname-$pkgver.tar.bz2")
sha256sums=('8adb90645d273d9549e1fa99b69ea87dc1fd612f7467eb18eee11a6b30c9ba5b')

build() {
  cd "$_downloadname-$pkgver"

  ./configure --prefix=/usr --libexecdir=/usr/lib \
             --disable-geanypy
  make
}

package() {
  make -C "$_downloadname-$pkgver" DESTDIR="$pkgdir" install
}

# getver: plugins.geany.org/downloads.html
# vim:set ts=2 sw=2 et:
