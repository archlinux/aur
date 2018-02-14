# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: Nothing4You

pkgname=mqrg-git
_gitname="microqrcode"
pkgver=r41.91115b1
pkgrel=1
pkgdesc="microqrcode generator draws QR codes into the text terminal"
url="https://github.com/trezor/microqrcode"
arch=('i686' 'x86_64')
license=('MIT')
source=(git+https://github.com/trezor/${_gitname}.git)
depends=('glibc')
makedepends=('git' 'check')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${_gitname}
  make || true
}

package() {
  cd ${srcdir}/$_gitname
  install -Dm755 ./test ${pkgdir}/usr/bin/${_gitname}
  install -Dm644 ./LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
md5sums=('SKIP')
