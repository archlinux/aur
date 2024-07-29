# Maintainer:  Uffe Jakobsen <> microtop at starion.dk <>

pkgname=ophis-git
_pkgname=Ophis
pkgver=r119.6a5e5a5
pkgrel=1
epoch=
pkgdesc="An assembler for the 6502 microprocessor"
arch=('i686' 'x86_64')
url="http://michaelcmartin.github.io/Ophis/"
license=('MIT')
groups=()
depends=('python')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=("ophis")
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/michaelcmartin/${_pkgname}.git)
sha256sums=('SKIP')

pkgver()
{
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  cd ${srcdir}/${_pkgname}

  python -m build
}

package()
{
  cd ${srcdir}/${_pkgname}

  python -m pip install --root=${pkgdir} .

  cd ${srcdir}/${_pkgname}
  install -Dm 644 "README" "${pkgdir}/usr/share/licenses/${pkgname}/README"
}

# EOF
