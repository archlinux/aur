# Maintainer: Alexandre Macabies <web+oss@zopieux.com>

pkgname=rofi-screenshot-git
_gitname=rofi-screenshot
pkgver=r10.d3d6737
pkgrel=2
pkgdesc="Use rofi and ffcast to perform various types of screenshots and screen captures"
arch=('any')
url="https://github.com/ceuk/rofi-screenshot"
license=('WTFPL')
depends=('rofi' 'slop' 'xclip' 'ffcast')
source=('git+https://github.com/ceuk/rofi-screenshot.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname/"
  install -Dm755 "rofi-screenshot" "$pkgdir/usr/bin/rofi-screenshot"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_gitname/LICENSE"
}
