# Maintainer: Mutantoe <mutantoe+aur@mailbox.org>
pkgname=ytp-git
pkgver=0.0.0.gb209122
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
  cd $pkgname
  echo 0.0.0.g$(git describe --tags --always | sed 's/^v//;s/-/./g')
}

package() {
  cd "$pkgname"
  install -Dm755 ytp "$pkgdir/usr/bin/ytp"
}
