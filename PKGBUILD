# Maintainer: Omansh Krishn omansh@duck.com

pkgname=bloomeetunes-bin
_pkgname=ls.bloomee.musicplayer
pkgver=3.0.4
_build_num=202
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

sha512sums=('5e8c31ca15fcebf067a5c1c9516cdfe4f690e9db6d72b9463d80038b0b57a06b2c09a89da9cbe69425c1f0e3278f5555ae6f478d42287366cd14d7a3bf320f59'
            '2c8dbe0ddad675b7980deeb510ad7b5f361eb05ffec5ea817253f399af2270bc9a722209f86b36b7b12f3bb11a97026ae08e7b85a3733866f1cdef02bd2ed404')

package() {
  install -dm755 "${pkgdir}/opt"
  install -dm755 "${pkgdir}/usr/share/applications"

  install -Dm755 "${srcdir}/bloomee" "${pkgdir}/opt/bloomeetunes/bloomee"
  cp --preserve=mode -r "${srcdir}/data" "${pkgdir}/opt/bloomeetunes/data"
  cp --preserve=mode -r "${srcdir}/lib" "${pkgdir}/opt/bloomeetunes/lib"

  install -m644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"

}
