# Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Contributor: Logan Gorence <loganjohngorence@gmail.com>
# Contributor: Chris Down <chris@chrisdown.name>

pkgname=adb
pkgver=android.5.1.1_r4
pkgrel=1
pkgdesc="adb (Android Debug Bridge CLI tool), an Android platform tool"
arch=('i686' 'x86_64' 'armv7h')
url="http://tools.android.com/"
license=('Apache')
depends=('openssl' 'zlib')
makedepends=('git')
conflicts=('adb-git')
source=("https://android.googlesource.com/platform/system/core/+archive/android-${pkgver//android\./}.tar.gz"
        'adbMakefile')
sha512sums=('326c4c28ca09dd9d9854dc6e9c3ac735acf446ae63cac9bbc630ae8fed281e3e83c92951d2ed94c9f8f342dad12a098fe41be8c7a97b4808fa2b48be7d217ef2'
            '46c5ff1938a9da99628d18904487418013fe5e150e84de88bf37000c84620e9cd20d4c0c78516ee5b1f0a150f73e4f0f801ff8f991a41a476536c4feb12101e2')

build() {
  cd $srcdir/adb
  mv ../adbMakefile makefile
  make
}

package(){
  cd $srcdir
  install -Dm755 adb/adb "${pkgdir}"/usr/bin/adb
}
