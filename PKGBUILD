# Maintainer: Joris Steyn <jorissteyn@gmail.com>
# Contributor: Curtis McEnroe <programble@gmail.com>
pkgname=git-extras-git
pkgver=1.9.0.9.ge91da7c
pkgrel=1
pkgdesc="GIT utilities -- repo summary, repl, changelog population, author commit percentages and more"
arch=('any')
url="https://github.com/visionmedia/git-extras"
license=('MIT')
depends=('git')
makedepends=('git')
conflicts=('git-extras')
provides=('git-extras')
source=('git://github.com/visionmedia/git-extras.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/git-extras"
  git describe --tags --always|sed 's|-|.|g'
}

package() {
  cd "$srcdir/git-extras"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
