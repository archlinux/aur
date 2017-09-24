# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)

_pkgname=plotbitrate
pkgname=$_pkgname-git
pkgver=0.r13.f93131f
pkgrel=1
pkgdesc="a script for plotting the bitrate of an audio or video stream over time"
arch=('any')
url="https://github.com/zeroepoch/plotbitrate"
license=('BSD')
depends=('python-matplotlib' 'ffmpeg')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  install -Dm755 "$_pkgname.py" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
