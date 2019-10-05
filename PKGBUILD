# Maintainer: Uffe Jakobsen <uffe_|_at_|_starion_|_dot_|_dk>
# Past maintainer: Sebastian Wolf <fatmike303 at googlemail dot com>
pkgname=acme-git
_pkgname=acme
pkgver=r74.99fae48
pkgrel=1
pkgdesc="Cross-assembler for MOS 6502, 6510, 65C02 and 65816 CPUs"
arch=('i686' 'x86_64')
url="https://github.com/meonwax/acme"
license=('GPL')
source=('git+https://github.com/meonwax/acme.git')
makedepends=('git')
conflicts=('acme')
provides=('acme')
sha256sums=('SKIP')

pkgver()
{
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  cd "${srcdir}/${_pkgname}/src"
  make || return 1
}

package()
{
  cd "${srcdir}/${_pkgname}/src"
  install -D -m755 acme ${pkgdir}/usr/bin/acme
}

#
# EOF
#
