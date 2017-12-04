# Maintainer: David Runge <dave@sleepmap.de>
# Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: clarence <catchfire at gmail dot com>

pkgname=patchage
pkgver=1.0.0
pkgrel=5
pkgdesc="A modular patch bay for audio and MIDI systems based on Jack and Alsa"
arch=('x86_64')
url="https://drobilla.net/software/patchage"
license=('GPL3')
depends=('ganv' 'jack')
makedepends=('boost' 'python2')
source=("https://download.drobilla.net/$pkgname-$pkgver.tar.bz2")
sha512sums=('0a2be0183257a34a68ec84e6fb17d29a3d8ba7dd54a05fcdd13784ac8f5621eb7a376f17d42168958f5e1a8dab8858a9c5c8c867aa1838736cc2b7775f75f510')

build() {
  cd "${pkgname}-${pkgver}"
  python2 waf configure --prefix=/usr
  python2 waf build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 waf install --destdir="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
