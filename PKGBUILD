# Maintainer: Miika Hänninen <miika.hanninen@gmail.com>
pkgname=vimv-git
pkgver=r21.f011fe5
pkgrel=1
pkgdesc="Batch-rename files using Vim"
arch=('any')
url="https://github.com/thameera/vimv"
license=('MIT')
groups=()
depends=('bash' 'git')
makedepends=('git')
optdepends=()
provides=('vimv')
conflicts=('vimv')
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname::git://github.com/thameera/vimv.git)
noextract=()
md5sums=('SKIP') #autofill using updpkgsums

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"

  cp "$srcdir/$pkgname/vimv" "$pkgdir/usr/bin/vimv"
  cp "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
