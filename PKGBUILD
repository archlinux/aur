# Maintainer: Moritz Johner <beller.moritz@googlemail.com>
pkgname=glitchlock
pkgver=0.34
pkgrel=1
pkgdesc="a glitch art lockscreen for linux"
arch=('x86_64')
url="https://github.com/moolen/glitchlock"
license=('APACHE')
groups=()
depends=(glibc pam libx11 tesseract)
makedepends=('go>=1.8')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/moolen/${pkgname}/archive/${pkgver}.tar.gz")
noextract=()
md5sums=('a60888b22c26f7631ba8bc10ae9db38a')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  LDFLAGS=""
  make -e VERSION=${pkgver}
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  install -Dm0755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

