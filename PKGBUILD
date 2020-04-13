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
pkgver=0.5.2
pkgrel=1
pkgdesc="Utilities for emu10k1 cards (e.g. asfxload)"
arch=('i686' 'x86_64')
url="https://github.com/tiwai/awesfx"
license=('GPL2')
depends=('alsa-lib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tiwai/awesfx/archive/v0.5.2.tar.gz")
sha256sums=('0d3ff4e00b22cf9ef8b538304a6a11391e8618dae112f56f16e3083379ac8888')

build() {
  cd "${pkgname}-${pkgver}"

  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
