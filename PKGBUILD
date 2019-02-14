# Maintainer: Mutantoe <mutantoe+aur@mailbox.org>
pkgname=ytp-git
pkgver=r49.6c3a081
pkgrel=1
pkgdesc='Searches and plays Youtube videos'
arch=('any')
url='https://gitlab.com/uoou/ytp'
license=('GPL2')
depends=('jq' 'youtube-dl' 'mpv')
provides=('ytp')
source=("$pkgname::git+https://gitlab.com/uoou/ytp.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -Dm755 ytp "$pkgdir/usr/bin/ytp"
}
