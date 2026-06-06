# Maintainer: Massimo Pavoni (damax) <real dot damax at gmail dot com>
# Contributor: sQVe <oskargrunning@gmail.com>

_pkgname=weechat-notify-send
pkgname="$_pkgname-git"
pkgver=0.11.r1.gfb3d8d0
pkgrel=1
pkgdesc="A WeeChat script that sends highlight and message notifications through notify-send"
url="https://github.com/s3rvac/weechat-notify-send"
arch=('any')
license=('MIT')
depends=(
  'libnotify'
  'python'
  'weechat'
)
makedepends=('git')
_pkgsrc="weechat-notify-send"
source=("git+https://github.com/s3rvac/weechat-notify-send.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

package() {
  cd "$_pkgsrc"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 notify_send.py "${pkgdir}/usr/share/weechat/python/notify_send.py"
}
