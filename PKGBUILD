# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
# shellcheck disable=all

pkgname=proctl
pkgver=2022.02.19
pkgrel=1
pkgdesc="Github Project Manager"
arch=('any')
groups=('therepoclub')
url="https://github.com/The-Repo-Club/$pkgname"
license=('MIT')
depends=('bash' 'coreutils')
optdepends=('git: generating default config automatically' 'fzf: -pick-license, -pick-language, -new-template flags' 'ncurses: for the colors')
makedepends=('git')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('3332ed684d43e0a77e355d3de9537ed9bd20f1fd528bc852d0f790498436971e')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
