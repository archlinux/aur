# Maintainer: HanFox <han@hanfox.co.uk>
# Based on the 'community/openttd' PKGBUILD by: Vesa Kaihlavirta <vegai@iki.fi>

pkgname=openttd-jgrpp
pkgver=0.30.2
pkgrel=1
pkgdesc="OpenTTD with JGR's patch pack."
arch=('i686' 'x86_64')
url='http://www.tt-forums.net/viewtopic.php?f=33&t=73469'
license=('GPL')
depends=('libpng' 'sdl' 'icu' 'fontconfig' 'lzo' 'hicolor-icon-theme' 'desktop-file-utils' 'tar')
source=("https://github.com/JGRennison/OpenTTD-patches/archive/jgrpp-${pkgver}.tar.gz")
sha256sums=('f0d208923d26876c5f6ea7c46d4cebe801e6b85c708d6d45e154ead67b0978bc')

_dirname=OpenTTD-patches-jgrpp

build() {
  cd ${_dirname}-${pkgver} 
  
 ./configure \
    --prefix-dir=/usr \
    --binary-name=${pkgname} \
    --binary-dir=bin \
    --data-dir=share/${pkgname} \
    --install-dir=${pkgdir} \
    --doc-dir=share/doc/${pkgname} \
    --menu-name="OpenTTD (JGR Patch Pack)" \
    --personal-dir=.${pkgname}

  make
}

package() {
  cd ${_dirname}-${pkgver}
  
  mkdir -p ${pkgdir}/usr/share/${pkgname}/{data,game}

  make install
} 
