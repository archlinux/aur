# Maintainer: Stefan Ott <arch at desire dot ch>
# Contributor: Miikka Ahonen <ma65547 at gmail dot com>
# Contributor: Jean-Sébastien Leroy <jean.sebastien.leroy+awesfx@gmail.com>
# Contributor: Mark <mark+awesfx@caffeine-powered.net>
# Contributor: Pavle Simovic <xpio+awesfx@tesla.rcub.bg.ac.rs>

# References:
# http://www.alsa-project.org/~tiwai/awedrv.html
# http://ftp.suse.com/pub/people/tiwai/awesfx/

# For 0.5.1c use: awesfx-0.5.1c-getline.patch
# Find it here:   https://bugs.gentoo.org/show_bug.cgi?id=270486

pkgname=awesfx
pkgver=0.5.1e
pkgrel=1
pkgdesc="Utilities for emu10k1 cards (e.g. asfxload)"
arch=('i686' 'x86_64')
url="http://www.alsa-project.org/~tiwai/awedrv.html"
license=('GPL2')
depends=('alsa-lib')
source=("http://ftp.suse.com/pub/people/tiwai/awesfx/${pkgname}-${pkgver}.tar.bz2")
sha1sums=('cd9aa258cd28ef7179a375925be4874058316ff7')

build() {
  cd "${pkgname}-${pkgver}"
  
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
