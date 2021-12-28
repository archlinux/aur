# Maintainer: Oleh Prypin <oleh@pryp.in>
# Contributor: Lance Chen <cyen0312+aur@gmail.com>

pkgname=nodejs-livescript
pkgver=1.6.1
pkgrel=1
pkgdesc="LiveScript is a language which compiles to JavaScript"
arch=(any)
url="https://livescript.net/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://github.com/gkz/LiveScript/archive/${pkgver}.tar.gz")
noextract=("${pkgver}.tar.gz")
sha1sums=('6a23a82623c1c2a50dffc5c0aa576600503ee7a7')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgver}.tar.gz"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}
