_repo="mutter-push"
pkgname=${_repo}-git
pkgver=r29.7f15a8a
pkgrel=1
pkgdesc="ZNC module for the Mutter IRC client"
arch=('i686' 'x86_64')
url="http://mutterirc.com"
license=('Apache')
depends=('znc')
source=("git+https://bitbucket.org/jmclough/mutter-push.git")

pkgver() {
  cd "$_repo"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  true
}

package() {
  cd "$_repo"
  install -Dm755 mutter.py "$pkgdir/usr/lib/znc/mutter.py"
}
sha256sums=('SKIP')
