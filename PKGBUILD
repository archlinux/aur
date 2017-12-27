# Maintainer:  Konstantin Gorodinskii <mail@konstantin.io>
pkgname='wabt'
url="https://github.com/WebAssembly/wabt"
pkgver=1370
pkgrel=1
arch=('x86_64')
license=('APACHE')
depends=()
makedepends=('cmake' 'git' 'gcc' 'clang')
source=("git+https://github.com/WebAssembly/wabt")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${pkgname}
  git rev-list --count HEAD
}

build() {
  cd "$srcdir/$pkgname"
  git submodule update --init
  make
}

package() {
  pkgdesc="WABT (we pronounce it "wabbit") is a suite of tools for WebAssembly, including"
  provides=('wabt')

  install "$srcdir/$pkgname"/bin/*  -t /usr/bin
  # make DESTDIR="$pkgdir/bin/" prefix="/usr/bin/" install
#   cd "$srcdir/${_pkgname}"

#   install -Dm755 binaries/system/pyrogenesis "${pkgdir}/usr/bin"
#   install -Dm755 binaries/system/*.so "${pkgdir}/usr/lib/${_pkgname}"
#   install -Dm755 build/resources/${_pkgname}.sh "${pkgdir}/usr/bin/${_pkgname}"
#   install -Dm644 build/resources/${_pkgname}.desktop \
#     "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
#   install -Dm644 build/resources/${_pkgname}.png \
#     "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
