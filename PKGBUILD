# Maintainer: Funami
pkgname=py-spy-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Sampling profiler for Python programs"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/benfred/py-spy"
license=('MIT')
provides=('py-spy')
conflicts=('py-spy')
source=("$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/benfred/py-spy/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://github.com/benfred/py-spy/releases/download/v$pkgver/py_spy-$pkgver-py2.py3-none-manylinux_2_5_x86_64.manylinux1_x86_64.whl")
source_i686=("$pkgname-$pkgver-i686.zip::https://github.com/benfred/py-spy/releases/download/v$pkgver/py_spy-$pkgver-py2.py3-none-manylinux_2_5_i686.manylinux1_i686.whl")
source_armv7h=("$pkgname-$pkgver-armv7h.zip::https://github.com/benfred/py-spy/releases/download/v$pkgver/py_spy-$pkgver-py2.py3-none-manylinux_2_17_armv7l.manylinux2014_armv7l.whl")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::https://github.com/benfred/py-spy/releases/download/v$pkgver/py_spy-$pkgver-py2.py3-none-manylinux_2_17_aarch64.manylinux2014_aarch64.whl")
noextract=("$pkgname-$pkgver-x86_64.zip"
           "$pkgname-$pkgver-i686.zip"
           "$pkgname-$pkgver-armv7h.zip"
           "$pkgname-$pkgver-aarch64.zip")
sha256sums=('80bbb8731db59cd835f59fcd06f127953804bb511c8487fd265d96c7c702cd00')
sha256sums_x86_64=('aeb0323409199c785f730645e9f4bb7a7b9ca2c481f2c331a55642b5d13fa52f')
sha256sums_i686=('24720573f95230653b457671a1dcc3c5a381fcf4e92677761e328a430ad251b2')
sha256sums_armv7h=('7f1c6d9b0e2379ead5bf792df43f4cf36153aa79e6dda4fb8ac7740cf8017110')
sha256sums_aarch64=('142887e984a4e541071c99a4401ff8c3770f255d329dbd0f64e8c1dd51882cce')

prepare() {
  mkdir -p "$pkgname-$pkgver-$CARCH"
  bsdtar -xf "$pkgname-$pkgver-$CARCH.zip" -C "$pkgname-$pkgver-$CARCH"
}

package() {
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/py-spy/LICENSE"
  
  cd "$pkgname-$pkgver-$CARCH/py_spy-$pkgver.data/scripts"
  install -Dm755 py-spy -t "$pkgdir/usr/bin"
}
