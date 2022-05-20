# Maintainer: Skythrew <skythrew@protonmail.com>
pkgname=cups-bjnp-backend
pkgver=2.0.3
pkgrel=1
pkgdesc="Cups Backend for BJNP"
arch=('i686' 'x86_64')
url="https://github.com/Skythrew/cups-bjnp-backend"
license=('GPL')
groups=()
depends=('libcups')
makedepends=('cups')
source=('https://github.com/Skythrew/cups-bjnp-backend/releases/download/v2.0.3/cups-bjnp-backend.tar.xz')
md5sums=('23bcb4e8746ff95e279bcf5952303cb8')
build() {
  cd cups-bjnp-backend

  # Patch for https://gcc.gnu.org/onlinedocs/gcc-8.1.0/gcc/Warning-Options.html#index-Wstringop_002dtruncation
  # sed -i 's/strncpy/memcpy/' bjnp-commands.c

  ./configure --prefix='/usr'
  make
}

package() {
  cd cups-bjnp-backend

  make DESTDIR="${pkgdir}" install
}
