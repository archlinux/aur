# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=wp2git.py-git
pkgver=r56.2c61906
pkgrel=1
pkgdesc="A tool to download and import a Wikipedia page to a Git repository"
arch=('any')
url="https://github.com/simon04/wp2git"
license=('custom')
depends=('python' 'python-mwclient' 'git')
source=(
  "$pkgname::git+https://github.com/simon04/wp2git.git"
)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -Dm755 wp2git.py $pkgdir/usr/bin/wp2git.py
  install -D LICENSE $pkgdir/usr/share/licenses/wp2git.py-git/LICENSE
}
