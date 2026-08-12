pkgname=sash
pkgver=3.8
pkgrel=1
pkgdesc='A small (static) UNIX Shell ()'
url='https://www.canb.auug.org.au/~dbell/'
arch=(x86_64)
license=(
  custom
)

depends=(
  zlib-static
)

source=(
  https://www.canb.auug.org.au/~dbell/programs/${pkgname}-${pkgver}.tar.gz
)

sha512sums=('e544721dbb5d13d2184531a2caa4b90fb29fc360e2b80f64adb2433cbe4e5588171f3567bde03b520fbe7cbd0f3007e0e9c9c41cb16570709b03cedc2dfbe291')

# prepare() {
#   cd ${pkgname}-${pkgver}
#   sed -i '/-static/d' Makefile
# }

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 0755 sash "${pkgdir}"/usr/bin/sash
	install -Dm 0644 sash.1 "${pkgdir}"/usr/share/man/man1/sash.1
}
