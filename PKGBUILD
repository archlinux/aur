# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=nemo-media-columns
_ver=2.6.0+rafaela
pkgver=2.6.0
pkgrel=1
pkgdesc="Nemo extension to display music/EXIF and PDF metadata info"
arch=(any)
url="http://packages.linuxmint.com/pool/main/n/nemo-media-columns/"
license=(GPL)
depends=(mutagen nemo-python python2-exiv2 python2-pillow python2-pypdf)
source=("http://packages.linuxmint.com/pool/main/n/nemo-media-columns/nemo-media-columns_${_ver}.tar.gz"
        fixes.patch)
sha512sums=('064305dedd94b8c53c993a0ce6944925e40d70fedb45d7571a7b85537de21c856bafd987db3aa4cd8c78f2b078d4702b72af76da488ddfa5c884beb4f952046a'
            '0f352129c727a74be9bdae32c86ea32a801449bcdeb86376cc10a53f9974441eb788f23156d58d97e2066eff2255aeb9c4ddd9c7ffd8430c4b957c57aa4cda2d')

prepare() {
  cd "${pkgname}-${_ver}"
  sed -i "s|^\(#!.*python\)$|\12|" nemo-media-columns.py
  patch -p1 -i ../fixes.patch
}

package() {
  cd "${pkgname}-${_ver}"
  install -dm755 "${pkgdir}/usr/share/nemo-python/extensions/"
  install -m644 nemo-media-columns.py \
                "${pkgdir}/usr/share/nemo-python/extensions/"
}
