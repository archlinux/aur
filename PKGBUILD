# Maintainer: RJ Haughton <rjahrj@gmail.com>
pkgname=nuaur-git
pkgver=5.7c101cd
pkgrel=1
pkgdesc="A Nushell script to build, sign, and search AUR packages, for a local Repo."
arch=('any')
url="https://github.com/tororutsu/nuaur"
license=('MIT')
depends=('nushell' 'gnupg' 'devtools')
makedepends=('git')
source=("$pkgname::git+https://github.com/tororutsu/nuaur.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the latest commit hash as the package version
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "nuaur" "$pkgdir/usr/bin/nuaur"
}
