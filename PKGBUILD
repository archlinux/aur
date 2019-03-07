# Maintainer: sQVe <oskargrunning@gmail.com>

arch=('any')
depends=('weechat' 'libnotify')
license=('MIT')
sha512sums=('SKIP')
pkgdesc='A WeeChat script that sends highlight and message notifications through notify-send'
pkgname=weechat-notify-send-git
pkgrel=1
pkgver=r180.962218a
source=('git+https://github.com/s3rvac/weechat-notify-send.git')
makedepends=('git')
url='https://github.com/s3rvac/weechat-notify-send'

_gitname='weechat-notify-send'

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_gitname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 notify_send.py "${pkgdir}/usr/lib/weechat/python/notify_send.py"
}
