# Maintainer: HeCodes2Much <HeCodes2Much@github.com>
# Contributor: HeCodes2Much <HeCodes2Much@github.com>
# shellcheck disable=all

pkgname=proctl
pkgver=2022.02.21
pkgrel=1
pkgdesc="Github Project Manager"
arch=('any')
groups=('therepoclub')
url="https://github.com/HeCodes2Much/$pkgname"
license=('MIT')
depends=('bash' 'coreutils')
optdepends=('git: generating default config automatically' 'fzf: -pick-license, -pick-language, -new-template flags' 'ncurses: for the colors')
makedepends=('git')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('013bdc6ce2a3c69da020d38de4e241a257a5fbb0bf0b1bb32bccacd2f0364ca9')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
