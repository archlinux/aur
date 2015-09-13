# Maintainer: Aleksey Kravchenko <kravchenko.aleksey@gmail.com>
_pkgname=mrim-prpl
pkgname=pidgin-${_pkgname}-git
pkgver=20150913
pkgrel=1
pkgdesc="Mail.Ru Agent protocol plugin for Pidgin (libpurple)"
arch=('x86_64' 'i686')
url="https://bitbucket.org/mrim-prpl-team/mrim-prpl"
license=('GPLv2')
depends=('libpurple')
makedepends=('cmake' 'gcc' 'git')
provides=('mrim-prpl')
conflicts=('pidgin-mrim-prpl')
source=("git+https://bitbucket.org/mrim-prpl-team/mrim-prpl.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  cmake ./ && make
}

package() {
  cd "${srcdir}/${_pkgname}"
  pidgin_pixmaps="/usr/share/pixmaps/pidgin/protocols/"
  install -Dm 755 libmrim.so "${pkgdir}/usr/lib/purple-2/libmrim.so"
  install -Dm 644 "pixmaps/mrim16.png" "${pkgdir}/${pidgin_pixmaps}/16/mrim.png"
  install -Dm 644 "pixmaps/mrim22.png" "${pkgdir}/${pidgin_pixmaps}/22/mrim.png"
  install -Dm 644 "pixmaps/mrim48.png" "${pkgdir}/${pidgin_pixmaps}/48/mrim.png"
}

# vim:set ts=2 sw=2 et:
