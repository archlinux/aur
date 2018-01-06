# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=vapoursynth-plugin-f3kdb
pkgver=2.0.0
pkgrel=1
pkgdesc='flash3kyuu deband plugin for VapourSynth'
arch=('x86_64')
url='https://github.com/SAPikachu/flash3kyuu_deband'
license=('GPL3')
depends=('gcc-libs' 'glibc' 'vapoursynth')
source=("vapoursynth-plugin-f3kdb-${pkgver}.tar.gz::https://github.com/SAPikachu/flash3kyuu_deband/archive/${pkgver}-1.tar.gz")
md5sums=('a18d2c87439fdf0aa21dd01ab5dfbb59')

build() {
  cd flash3kyuu_deband-${pkgver}-1

  ./waf configure \
    --prefix='/usr' \
    --libdir='/usr/lib/vapoursynth'
  ./waf build
}

package() {
  cd flash3kyuu_deband-${pkgver}-1

  ./waf install \
    --destdir="${pkgdir}" \
    --no-ldconfig
}

# vim: ts=2 sw=2 et:
