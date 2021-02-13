# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=onscripter-jh-bin
_pkgname=${pkgname%-bin}
pkgdesc="An optimized SDL port of ONScripter, a game scripting engine"
pkgver=20181231
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://bitbucket.org/jh10001/onscripter-jh"
license=('GPL2')
depends=('sdl_mixer'
         'sdl_ttf'
         'sdl_image'
         'libjpeg-turbo'
         'bzip2'
         'libvorbis'
         'lua51'
         'fontconfig'
         'smpeg')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source_x86_64=("https://repo.aosc.io/debs/pool/stable/main/o/${_pkgname}_${pkgver}-1_amd64.deb")
source_aarch64=("https://repo.aosc.io/debs/pool/stable/main/o/${_pkgname}_${pkgver}-1_arm64.deb")
sha256sums_x86_64=('186501991246abfc4d0c12bdc3fcbd74fb7ce8122607c1ee893ab77802de5392')
sha256sums_aarch64=('ef5dc744cdc964d59b8e318eab174605434b80b2715fe57d4c81419cf32f555e')

prepare() {
  mkdir -p build
  tar -xf data.tar.xz -C build
}

package() {
  install -Dm755 ${srcdir}/build/usr/lib/${_pkgname} -t ${pkgdir}/usr/bin
}

# vim: set sw=2 ts=2 et:
