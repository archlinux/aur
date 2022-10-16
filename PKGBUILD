# Maintainer: Hayate Nakamura <is01.njb@gmail.com>
pkgname=unifetch-git
_pkgname=unifetch
pkgver=22.10
pkgrel=16
pkgdesc="An unofficial successor of neofetch, fresh version."
arch=('any')
url="https://github.com/jin-asanami/"
license=('MIT')
depends=('bash')
makedepends=('git')
checkdepends=('shellcheck')
makedepends=('git')
conflicts=("unifetch")
source=(${_pkgname}::"git+${url}/${_pkgname}.git")
sha512sums=('SKIP')

package() {
  cd ${_pkgname}
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
