# Maintainer: Richard Leek <richard@richardleek.com>
_pkgname=cryptocoins
pkgname=cryptocoins-git
pkgver=da791cf
pkgrel=1
pkgdesc="Cryptocoins is the most complete vector/webfont icon pack of your favourite cryptocurrencies"
arch=(any)
makedepends=('git')
depends=(fontconfig xorg-font-utils)
url="https://github.com/allienworks/cryptocoins"
license=('MIT')
source=("${_pkgname}::git+https://github.com/AllienWorks/cryptocoins")
install=$pkgname.install
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/$_pkgname"
    install -D -m644 webfont/cryptocoins.ttf "${pkgdir}/usr/share/fonts/misc/cryptocoins.ttf"
    install -D -m755 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

