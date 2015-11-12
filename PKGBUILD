# Maintainer: Vladimir Kosteley <zzismd@gmail.com>
_pkgname=screenshotgun
pkgname=$_pkgname-git
pkgver=0.12_20151112
pkgrel=1
pkgdesc="Open screenshoter with server part"
arch=(any)
url="http://screenshotgun.com"
license=('GPL')
groups=()
depends=('qt5-base')
makedepends=('git')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$_pkgname::git+https://github.com/ismd/screenshotgun.git")
noextract=()
sha256sums=()
md5sums=('SKIP')

build() {
  mkdir "$srcdir/build-$_pkgname"
  cd "$srcdir/build-$_pkgname"

  cmake "$srcdir/$_pkgname"
  cmake --build .
  strip screenshotgun
}

package() {
  install -Dm755 "$srcdir/build-$_pkgname/screenshotgun" "$pkgdir/usr/bin/screenshotgun"
  install -Dm644 "$srcdir/$_pkgname/dist/screenshotgun.desktop" "$pkgdir/usr/share/applications/screenshotgun.desktop"
  install -Dm644 "$srcdir/$_pkgname/dist/screenshotgun.png" "$pkgdir/usr/share/pixmaps/screenshotgun.png"
}
