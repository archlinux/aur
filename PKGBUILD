# Maintainer: Funami
pkgname=py-spy-bin
pkgver=0.3.11
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
sha256sums_x86_64=('6f7ba3ae9f6a61ca2e10367427ee8d39d46880b09a78a90e6899b02601187c8d')
sha256sums_i686=('3b80db1630f5ca1314b72e7f739c00329bc44a8fd06f44a2d708267c248fce2f')
sha256sums_armv7h=('e35a4720859dfd86238df5ac17d63d1f08901d40953ff5eac0bda5afdf744b22')
sha256sums_aarch64=('3fbd42d211fe5c4cdf650b194940c1f053fe30b5fbba09e933432535a13867a5')

prepare() {
  mkdir -p "$pkgname-$pkgver-$CARCH"
  bsdtar -xf "$pkgname-$pkgver-$CARCH.zip" -C "$pkgname-$pkgver-$CARCH"
}

package() {
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/py-spy/LICENSE"
  
  cd "$pkgname-$pkgver-$CARCH/py_spy-$pkgver.data/scripts"
  install -Dm755 py-spy -t "$pkgdir/usr/bin"
}
