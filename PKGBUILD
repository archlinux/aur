# Maintainer: Kris <37947442+OfficialKris@users.noreply.github.com>
pkgname=license-generator-bash-git
pkgver=r6.632f7f9
pkgrel=1
pkgdesc="A POSIX compliant shell script that generates license for your open source projects"
arch=(x86_64)
url="https://github.com/SamIsTheFBI/license-generator"
license=(MIT)
optdepends=()
makedepends=(git curl fzf sed jq)
provides=(license-generator-bash)
conflicts=(license-generator-bash)
source=(git+$url)
md5sums=('SKIP')
_gitname="license-generator"

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  : # No build steps
}

package() {
  cd "${srcdir}/${_gitname}"

  # script
  install -vDm755 "gen-license" "$pkgdir/usr/local/bin/gen-license"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
