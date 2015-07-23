# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: JJDaNiMoTh <jjdanimoth.aur@gmail.com>
# Contributor: Tan Xiang <txcary@gmail.com>

pkgname=wqy-bitmapsong-beta
pkgver=1.0.0_rc1
_pkgver=1.0.0-RC1
pkgrel=1
pkgdesc="A bitmapped Song Ti (serif) Chinese font - Beta Version"
arch=('any')
url="http://wenq.org/"
license=('GPL' 'custom:"font embedding exception"')
depends=('xorg-font-utils' 'fontconfig')
provides=('wqy-bitmapfont')
conflicts=('wqy-bitmapfont')
install="wqy-bitmapsong-beta.install"
source=("http://downloads.sourceforge.net/wqy/wqy-bitmapsong-pcf-$_pkgver.tar.gz")
md5sums=('11205e41f7876b016041523c55f0c8af')

build() {
  :
}

package() {
  cd "$srcdir"/wqy-bitmapsong

  mkdir -p "$pkgdir"/usr/share/fonts/wenquanyi
  cp *.pcf "$pkgdir"/usr/share/fonts/wenquanyi

  mkdir -p "$pkgdir"/etc/fonts/conf.avail
  mkdir -p "$pkgdir"/etc/fonts/conf.d
  cp 85-wqy-bitmapsong.conf "$pkgdir"/etc/fonts/conf.avail
  cd "$pkgdir"/etc/fonts/conf.d
  ln -s ../conf.avail/85-wqy-bitmapsong.conf .

  install -Dm644 "$srcdir"/wqy-bitmapsong/COPYING \
                 "$pkgdir"/usr/share/licenses/wqy-bitmapsong/COPYING
}
