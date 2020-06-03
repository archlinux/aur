# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Alexander Görtz <aur@nyloc.de>

_pkgname=yourls-plugin-random-keywords
pkgname=$_pkgname-git
pkgver=r9.30cf54f
pkgrel=1
pkgdesc="Assign random keywords to shorturls, like bitly."
arch=('any')
url="https://github.com/YOURLS/random-keywords"
license=('MIT')
depends=('yourls')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/YOURLS/random-keywords.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  install -D plugin.php "${pkgdir}/usr/share/webapps/yourls/user/plugins/random-keywords/plugin.php"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
