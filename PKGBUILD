pkgname=openbox-theme-bluebird-openboxed
pkgver=20130428.r8.eadea03
pkgrel=1
epoch=1
pkgdesc="Bluebird theme for Openbox, based on Numix."
arch=('any')
url="https://github.com/scienzedellevanghe/Bluebird-openboxed"
license=('GPL3')
depends=('openbox')
makedepends=('git')
optdepends=('xfce-theme-bluebird' 'xfce-theme-greybird')
source=('git://github.com/scienzedellevanghe/Bluebird-openboxed.git')
md5sums=('SKIP')

pkgver() {
  cd Bluebird-openboxed

  printf "%s.r%s.%s" "$(git log -1 --format=%cd --date=short |
  sed 's/\-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd Bluebird-openboxed

  install -d -m 755 "$pkgdir"/usr/share/themes/Bluebird-openboxed/
  cp -r openbox-3/  "$pkgdir"/usr/share/themes/Bluebird-openboxed/
}
