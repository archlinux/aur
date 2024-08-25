# Maintainer: HeCodes2Much <HeCodes2Much@github.com>
# Contributor: HeCodes2Much <HeCodes2Much@github.com>
# shellcheck disable=all

pkgname=proctl
pkgver=2024.08.25
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
sha256sums=('e8393f42e20cf0df411ad14962dd4c04ff3eab6884275548d3d46c78c97fdc31')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
