# Maintainer: ZSchoen <dev at zschoen dot dev>
_pkgname='reSnap'
pkgname=$(echo "$_pkgname-git" | tr '[:upper:]' '[:lower:]')
pkgdesc="reMarkable screenshots over SSH."
pkgver=r110.fa7d712
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
url="https://github.com/cloudsftp/reSnap"
arch=('any')
license=('MIT')
depends=('openssh' 'ffmpeg' 'lz4' 'feh')
makedepends=('git')
source=("git+https://github.com/cloudsftp/reSnap.git")
md5sums=('SKIP')

package() {
    install -Dm644 "$startdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$_pkgname/README.md" "$pkgdir/usr/share/$pkgname/README.md"
    install -Dm644 "$srcdir/$_pkgname/misc/demo.gif" "$pkgdir/usr/share/$pkgname/misc/demo.gif"
    install -Dm755 $srcdir/$_pkgname/reSnap.sh $pkgdir/usr/bin/resnap
}
