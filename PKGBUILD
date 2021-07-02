# Maintainer: sQVe <oskargrunning@gmail.com>

pkgname=weechat-emoji-git
pkgver=r5.b6c25b2
pkgrel=2
pkgdesc='Weechat plugin to replace emoji in the "colon" format with unicode equivalents!'
url='https://github.com/kattrali/weemoji'
arch=('any')
license=('BSD2')
depends=('weechat')
makedepends=('git')
source=('git+https://github.com/kattrali/weemoji.git')
sha512sums=('SKIP')

_gitname='weemoji'

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_gitname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 weemoji.py "${pkgdir}/usr/share/weechat/python/weemoji.py"
}
