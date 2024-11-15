# Maintainer: Bastien "neitsab" Traverse <neitsab@archlinux.org>

pkgname=llama.cpp-bin
pkgver=b4082
pkgrel=1
pkgdesc="LLM inference in C/C++ (precompiled Linux binaries)"
arch=("x86_64")
url="https://github.com/ggerganov/llama.cpp"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
depends=(curl gcc-libs)
source=("${pkgname%-bin}-${pkgver}.zip"::"${url}/releases/download/${pkgver}/llama-${pkgver}-bin-ubuntu-x64.zip")
sha256sums=('485ec511ff8baceadd77b70ddca2a1b4782296fbd6e3ec6470a73e8cce884ee0')

package() {
  install -Dm755 build/bin/{llama,rpc,test}-* -t "${pkgdir}/usr/bin/"
  install -Dm644 "build/bin/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
