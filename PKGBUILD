# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Mutantoe <mutantoe+aur@mailbox.org>

_pkgname=ytp
pkgname=ytp-git
pkgver=r52.b34c5cb
pkgrel=2
pkgdesc="Searches and plays Youtube stuff"
arch=('any')
url="https://gitlab.com/uoou/$_pkgname"
license=('GPL2')
depends=('jq' 'youtube-dl' 'mpv')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://gitlab.com/uoou/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}
