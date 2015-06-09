pkgname=xsunpinyin
pkgver=2.0.3
pkgrel=1
pkgdesc='The SunPinYin Engine for XIM. SunPinYin is a Statistical Language Model based pinyin IME by Sun.'
arch=('i686' 'x86_64')
url='http://sunpinyin.googlecode.com'
license=('LGPL')
depends=('gtk2' 'sunpinyin' 'xproto')
makedepends=('scons')
source=("http://sunpinyin.googlecode.com/files/xsunpinyin-2.0.3.tar.gz")
md5sums=('bfa3a3dc8c22193b3d1fb982316d462e')

build() {
  cd ${pkgname}-${pkgver}
  scons --prefix=/usr
}

package() {
  cd ${pkgname}-${pkgver}
  scons --prefix=/usr --install-sandbox=${pkgdir} install
}