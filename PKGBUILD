# Maintainer: envolution
# Contributor: Bastien "neitsab" Traverse <neitsab@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=llama.cpp-bin
pkgver=b7317
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

sha256sums=('7c717e3481457e625aab8378495e2ecd43fac94c75de5b64f670c9abedb14260'
            '3a46703ec7af53de03f687d9311dd4e56f5f3be9d589dfad45e157c9cdc3802f')

package() {
  install -Dm755 build/bin/{llama,rpc}-* -t "${pkgdir}/usr/bin/"
  install -Dm755 build/bin/lib* -t "${pkgdir}/usr/lib/"
  install -Dm644 "build/bin/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/$pkgname/README.md"
}
# vim:set ts=2 sw=2 et:
