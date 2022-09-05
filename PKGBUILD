# Maintainer: Funami
pkgname=py-spy-bin
pkgver=0.3.13
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
sha256sums_x86_64=('c2a56de1847685e10da84e8786f158c5efcf73e13f7b9add223373ec4e87f125')
sha256sums_i686=('2f916bfa4ee9b81a418d05ada538b33a8d9995ed846400b1ab51bd2e52632e1d')
sha256sums_armv7h=('92149548ca65a0423a1d0399ccdeb1ac40902ba2967c104c2f7127603ec6f726')
sha256sums_aarch64=('32b4490ba13331c87d3a4ab02b0a6c5bacea454091cc2f15d31ad629b10136cb')

prepare() {
  mkdir -p "$pkgname-$pkgver-$CARCH"
  bsdtar -xf "$pkgname-$pkgver-$CARCH.zip" -C "$pkgname-$pkgver-$CARCH"
}

package() {
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/py-spy/LICENSE"
  
  cd "$pkgname-$pkgver-$CARCH/py_spy-$pkgver.data/scripts"
  install -Dm755 py-spy -t "$pkgdir/usr/bin"
}
