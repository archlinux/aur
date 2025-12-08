# Maintainer: envolution
# Contributor: Bastien "neitsab" Traverse <neitsab@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=llama.cpp-bin
pkgver=b7315
pkgrel=1
pkgdesc="LLM inference in C/C++ (precompiled Linux binaries)"
arch=("x86_64")
url="https://github.com/ggerganov/llama.cpp"
license=('MIT')
provides=("llama.cpp" libggml ggml)
conflicts=("llama.cpp" libggml ggml)
depends=(curl gcc-libs)
source=("${pkgname%-bin}-${pkgver}.zip"::"${url}/releases/download/${pkgver}/llama-${pkgver}-bin-ubuntu-x64.zip"
  "README-${pkgver}.md::https://raw.githubusercontent.com/ggml-org/llama.cpp/${pkgver}/README.md")

sha256sums=('e70b305683d40c4f1b44a9e0d3cbf0bdae6e1c94beeef041bbe3ec9d09acefb5'
            '8d2636cc199ab1308d8e9ff4786d2e24f32c68a424e8816a7e7fa81807bbd4dd')

package() {
  install -Dm755 build/bin/{llama,rpc}-* -t "${pkgdir}/usr/bin/"
  install -Dm755 build/bin/lib* -t "${pkgdir}/usr/lib/"
  install -Dm644 "build/bin/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/$pkgname/README.md"
}
# vim:set ts=2 sw=2 et:
