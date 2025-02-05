# Maintainer: Bastien "neitsab" Traverse <neitsab@archlinux.org>

pkgname=llama.cpp-bin
pkgver=b4644
pkgrel=2
pkgdesc="LLM inference in C/C++ (precompiled Linux binaries)"
arch=("x86_64")
url="https://github.com/ggerganov/llama.cpp"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
depends=(curl gcc-libs)
source=("${pkgname%-bin}-${pkgver}.zip"::"${url}/releases/download/${pkgver}/llama-${pkgver}-bin-ubuntu-x64.zip")
sha256sums=('33954085d4649e7c04bf9085f4d0d932a03ed3a5fc57737830978df9feb4251e')

package() {
  install -Dm755 build/bin/{llama,rpc,test}-* -t "${pkgdir}/usr/bin/"
  install -Dm644 "build/bin/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
