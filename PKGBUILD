# Maintainer: sQVe <oskargrunning@gmail.com>

arch=('any')
depends=('weechat')
license=('BSD2')
sha512sums=('SKIP')
pkgdesc='Weechat plugin to replace emoji in the "colon" format with unicode equivalents!'
pkgname=weechat-emoji-git
pkgrel=1
pkgver=r5.b6c25b2
source=('git+https://github.com/kattrali/weemoji.git')
makedepends=('git')
url='https://github.com/kattrali/weemoji'

_gitname='weemoji'

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_gitname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 weemoji.py "${pkgdir}/usr/lib/weechat/python/weemoji.py"
}
