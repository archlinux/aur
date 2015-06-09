# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=nemo-media-columns
_ver=2.4.0+rebecca
pkgver=2.4.0
pkgrel=1
pkgdesc="Nemo extension to display music/EXIF and PDF metadata info"
arch=(any)
url="http://packages.linuxmint.com/pool/main/n/nemo-media-columns/"
license=(GPL)
depends=(mutagen nemo-python python2-exiv2 python2-pillow python2-pypdf)
source=("http://packages.linuxmint.com/pool/main/n/nemo-media-columns/nemo-media-columns_${_ver}.tar.gz"
        fixes.patch)
sha512sums=('e30f1ce9f6b251bccae478c5c518c7fb70ccba318109f128e7c4e0b8740ecc2ce8e2a797c2683746400c0dae56050d19a41b001b63166af16a360a62b51dfdf8'
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
