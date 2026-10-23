# Maintainer: Omansh Krishn omansh@duck.com

pkgname=bloomeetunes-bin
_pkgname=ls.bloomee.musicplayer
pkgver=3.1.0
_build_num=207
_relver=${pkgver}+${_build_num}
pkgrel=1
pkgdesc='Bloomee is a cross-platform music app designed to bring you ad-free tunes from various sources.'
arch=('x86_64')
url='https://github.com/HemantKArya/BloomeeTunes'
license=('GPL2')
depends=('gtk3' 'pango' 'harfbuzz' 'at-spi2-core' 'cairo' 'gdk-pixbuf2' 'glib2' 'gcc-libs')
provides=('bloomeetunes')
conflicts=('bloomeetunes-git')
options=(!debug)


source=("${url}/releases/download/v${_relver}/bloomee_tunes_linux_x64_v${_relver}.tar.gz"
        "${_pkgname}.desktop")

sha512sums=('b02d7d8a19ffacbb5a7707d8825afafefa8bccab6f1f0adc960407ae3fbabefc4e8947ca856910e77c73b67ff8773f33ff8fa767d90c8d7356402f14152b242e'
            '2c8dbe0ddad675b7980deeb510ad7b5f361eb05ffec5ea817253f399af2270bc9a722209f86b36b7b12f3bb11a97026ae08e7b85a3733866f1cdef02bd2ed404')

package() {
  install -dm755 "${pkgdir}/opt"
  install -dm755 "${pkgdir}/usr/share/applications"

  install -Dm755 "${srcdir}/bloomee" "${pkgdir}/opt/bloomeetunes/bloomee"
  cp --preserve=mode -r "${srcdir}/data" "${pkgdir}/opt/bloomeetunes/data"
  cp --preserve=mode -r "${srcdir}/lib" "${pkgdir}/opt/bloomeetunes/lib"

  install -m644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"

}
