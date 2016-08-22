# Maintainer: Dan Milon <i@danmilon.me>
pkgname=z-dir-jump-git
pkgver=20160822
pkgver() {
  date +%Y%m%d
}
pkgrel=1
pkgdesc="jump around - Tracks your most used directories, based on 'frecency'."
arch=(any)
url="https://github.com/rupa/z"
license=('unknown')
groups=()
depends=()
makedepends=(git)
optdepends=()
provides=('z-dir-jump')
conflicts=('z-dir-jump')
replaces=()
backup=()
options=()
install="$pkgname.install"
changelog=
source=("$pkgname::git://github.com/rupa/z.git")
md5sums=('SKIP')
noextract=()

package() {
  cd "$srcdir/$pkgname"
  install -Dp z.sh "$pkgdir/usr/share/z/z.sh"
  mkdir -p "$pkgdir/etc/profile.d/"
  echo ". /usr/share/z/z.sh" > "$pkgdir/etc/profile.d/z-dir-jump.sh"
}
