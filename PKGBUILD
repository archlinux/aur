# Maintainer: Bastien "neitsab" Traverse <neitsab@archlinux.org>

pkgname=llama.cpp-bin
pkgver=b4714
pkgrel=2
pkgdesc="LLM inference in C/C++ (precompiled Linux binaries)"
arch=("x86_64")
url="https://github.com/ggerganov/llama.cpp"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
depends=(curl gcc-libs)
source=("${pkgname%-bin}-${pkgver}.zip"::"${url}/releases/download/${pkgver}/llama-${pkgver}-bin-ubuntu-x64.zip")
sha256sums=('53e648eac3b9378b732e1dfed6fd67c746c385867818691aec1c5d84dba20449')

package() {
  install -Dm755 build/bin/{llama,rpc,test}-* -t "${pkgdir}/usr/bin/"
  install -Dm755 build/bin/lib* -t "${pkgdir}/usr/lib/"
  install -Dm644 "build/bin/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
