# Maintainer:   fft
# Contributor: redtide <redtid3 at gmail com>
# Contributor: dllud <dllud riseup net>
# Contributor: David McInnis <dave@dave3.xyz>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: djgera
# Contributor: Patrick Melo <patrick@patrickmelo.eti.br>

pkgname=geany-plugin-markdown
_downloadname=geany-plugins
pkgver=1.38
pkgrel=1
pkgdesc='Markdown plugin for Geany'
arch=('x86_64')
url='https://plugins.geany.org/'
license=('GPL')
depends=("geany>=$pkgver" 'webkit2gtk')
makedepends=('intltool')
#makedepends=('intltool' 'vala' 'gdb' 'cppcheck')
source=("https://plugins.geany.org/$_downloadname/$_downloadname-$pkgver.tar.bz2")
sha256sums=('1c578a7ebb390aa8882f195acd3d8da3ceb73925d291b28dec90cd3e5fd20586')
conflicts=('geany-plugins')

build() {
  cd "$_downloadname-$pkgver"

  ./configure --prefix=/usr --libexecdir=/usr/lib \
              --disable-all-plugins --enable-markdown
  make -C 'markdown'
}

package() {
  make -C "$_downloadname-$pkgver/markdown" DESTDIR="$pkgdir" install
}

