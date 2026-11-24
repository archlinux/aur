# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sudoku-in-terminal
_npmname=sudoku-in-terminal
pkgver=1.2.2
pkgrel=1
pkgdesc="Sudoku game in the terminal"
arch=('any')
url="https://github.com/mrozio13pl/sudoku-in-terminal"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/sudoku-in-terminal-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('fb2137626167d9ce82a9b7011f4143fd31e3ed319f250e6c9b9c9ede4067c6c5')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  mv "${pkgdir}/usr/bin/sudoku" "${pkgdir}/usr/bin/sudoku-in-terminal"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
