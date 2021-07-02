# Maintainer: sQVe <oskargrunning@gmail.com>

pkgname=weechat-notify-send-git
pkgver=r180.962218a
pkgrel=2
pkgdesc='A WeeChat script that sends highlight and message notifications through notify-send'
url='https://github.com/s3rvac/weechat-notify-send'
arch=('any')
license=('MIT')
depends=('weechat' 'libnotify')
makedepends=('git')
source=('git+https://github.com/s3rvac/weechat-notify-send.git')
sha512sums=('SKIP')

_gitname='weechat-notify-send'

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_gitname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 notify_send.py "${pkgdir}/usr/share/weechat/python/notify_send.py"
}
