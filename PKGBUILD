# Maintainer: RJ Haughton <rjahrj@gmail.com>

pkgname=nuaur-git
_pkgname="${pkgname%-git}"
pkgver=5.7c101cd
pkgrel=2
pkgdesc="A Nushell script to build, sign, and search AUR packages, for a local Repo."
arch=('any')
url="https://github.com/tororutsu/nuaur"
license=('MIT')
depends=('nushell' 'gnupg' 'devtools')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # Use the latest commit hash as the package version
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
