# Maintainer: Funami
pkgname=py-spy-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="Sampling profiler for Python programs"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/benfred/py-spy"
license=('MIT')
provides=('py-spy')
conflicts=('py-spy')
source=("$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/benfred/py-spy/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://github.com/benfred/py-spy/releases/download/v$pkgver/py_spy-$pkgver-py2.py3-none-manylinux1_x86_64.manylinux_2_5_x86_64.whl")
source_i686=("$pkgname-$pkgver-i686.zip::https://github.com/benfred/py-spy/releases/download/v$pkgver/py_spy-$pkgver-py2.py3-none-manylinux1_i686.manylinux_2_5_i686.whl")
source_armv7h=("$pkgname-$pkgver-armv7h.zip::https://github.com/benfred/py-spy/releases/download/v$pkgver/py_spy-$pkgver-py2.py3-none-manylinux2014_armv7l.manylinux_2_17_armv7l.whl")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::https://github.com/benfred/py-spy/releases/download/v$pkgver/py_spy-$pkgver-py2.py3-none-manylinux2014_aarch64.manylinux_2_17_aarch64.whl")
noextract=("$pkgname-$pkgver-x86_64.zip"
           "$pkgname-$pkgver-i686.zip"
           "$pkgname-$pkgver-armv7h.zip"
           "$pkgname-$pkgver-aarch64.zip")
sha256sums=('80bbb8731db59cd835f59fcd06f127953804bb511c8487fd265d96c7c702cd00')
sha256sums_x86_64=('8a4277225f470d394a85cca0cdd944bef87f0097b6f20150a6dd3ac2e92806b8')
sha256sums_i686=('a21b6958bf1200ff225c4f360834a77f7e12556ac11dcd863e26c9345b468783')
sha256sums_armv7h=('885d61020f763792e99cb3ad0788ae424b73cef45d5420ec9683f30e270b5d75')
sha256sums_aarch64=('bbcec46930d464b3bfc142d6d02ade4dd8ad5627823263b3eff0280e80c7c132')

prepare() {
  mkdir -p "$pkgname-$pkgver-$CARCH"
  bsdtar -xf "$pkgname-$pkgver-$CARCH.zip" -C "$pkgname-$pkgver-$CARCH"
}

package() {
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/py-spy/LICENSE"
  
  cd "$pkgname-$pkgver-$CARCH/py_spy-$pkgver.data/scripts"
  install -Dm755 py-spy -t "$pkgdir/usr/bin"
}
