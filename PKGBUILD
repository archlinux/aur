# Maintainer: TwoFinger
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=koka-bin
pkgver=3.1.1
pkgrel=1
pkgdesc="Koka: a function-oriented language with effect inference"
arch=(x86_64)
url="https://github.com/koka-lang/koka"
license=(Apache)
options=('!strip')
depends=(gcc make)
optdepends=(
  'clang: for C backend compiler'
  'nodejs: for JavaScript target'
  'emscripten: for WebAssembly target'
  'wasmtime: for running WebAssembly modules'
  'mono: for C# target'
)
provides=(koka)
conflicts=(koka)
_dlfilename="koka-v${pkgver}-linux-x64.tar.gz"
source=(
  "https://github.com/koka-lang/koka/releases/download/v${pkgver}/${_dlfilename}"
)
noextract=("${_dlfilename}")
sha256sums=(
  3c00088edcf085b9d26eba668f170b2411bea7f9d31aea6090a06533fcfc1373
)

package() {
  install -d "${pkgdir}/usr"
  tar -xzf "${_dlfilename}" -C "${pkgdir}/usr"
}
