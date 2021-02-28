# Maintainer: Logan Koester <logan@logankoester.com>
pkgname=smaug
pkgver=0.1.0
pkgrel=1
pkgdesc="A tool to manage your DragonRuby Game Toolkit projects"
arch=('x86_64')
url="https://smaug.dev/"
license=('AGPL3')
depends=(gcc-libs openssl zlib)
optdepends=()
source=("https://github.com/ereborstudios/smaug/releases/download/v${pkgver}/smaug-linux")
noextract=()
sha512sums=('1676c17e7a582e9a83738735751608cb402c9225928715c30c53c0589d1e0e4e043c4629446635700de7e2ea614e3c76fef431057a6f62f807c36140122e16ca')

pkgver() {
  git describe --tags main | cut -d- -f1 | sed 's/^v//'
}

package() {
  cd $srcdir
  install -Dm755 "${pkgname}-linux" "${pkgdir}/usr/bin/${pkgname}"
}
