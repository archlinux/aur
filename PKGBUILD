# Maintainer: longifn <longfinfunnel@gmail.com>

pkgname=spoqa-han-sans
pkgver=1.0.0
pkgrel=1
pkgdesc='TTF font for korean, english and japanese'
arch=('any')
url="http://www.spoqa-han-sans.com/"
license=('sil')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('tar')
source=("https://github.com/spoqa/spoqa-han-sans/archive/$pkgver.tar.gz")
md5sums=('ed6b47e9c28c3dd3893dfac2155ebfdf')


build() {
  cd $srcdir
  tar xzf $pkgver.tar.gz "spoqa-han-sans-$pkgver/Original"
}

package() {
  cd $pkgdir

  install -d -m 755 usr/share/fonts/TTF || return 1
  install -m 644 ${srcdir}/spoqa-han-sans-$pkgver/Original/**/*.ttf usr/share/fonts/TTF || return 1
}
