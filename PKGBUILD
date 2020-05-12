# Maintainer: Sol Bekic <s+aur at s-ol dot nu>

_pkgname=tekui
pkgname=lua-${_pkgname}
pkgver=1.12
pkgrel=1
pkgdesc="TekUI is a small, freestanding and portable graphical user interface (GUI) toolkit written in Lua and C."
url="http://tekui.neoscientists.org/"
arch=('x86_64')
license=('MIT')
depends=('lua' 'libx11' 'libxft' 'libxext' 'fontconfig')
optdepends=('lua-filesystem' 'lua-socket' 'lua-expat' 'lua-posix')

source=("http://tekui.neoscientists.org/releases/${_pkgname}-${pkgver}.tgz"
        config)
sha256sums=('28abfaacc0f2ddae962afbbca862a7fb619c33a99a497be9edd746091013dd7f'
            '69edaae02a6b43bdc42122c91e424a89474337426300f2aa83acff9541cbee54')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cp "${srcdir}/config" .
  make modules
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make install PREFIX="${pkgdir}"/usr
}
