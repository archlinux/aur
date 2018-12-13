# Maintainer: Chris Lahaye <dev@chrislahaye.com>
pkgname=git-fiddle
pkgver=606086d
pkgrel=1
pkgdesc="Edit commit messages, authors, and timestamps during git-rebase"
url="https://github.com/felixSchl/git-fiddle"
arch=('any')
license=('custom')
depends=('bash')
source=("git-fiddle::git+https://github.com/felixSchl/git-fiddle.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --always | sed 's|-|.|g'
}

package() {
  cd "$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 _fiddle_seq_editor "${pkgdir}/usr/bin/_fiddle_seq_editor"
  install -Dm755 git-fiddle "${pkgdir}/usr/bin/git-fiddle"
}
