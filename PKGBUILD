# Maintainer: TwoFinger
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=koka-bin
pkgver=3.0.0
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
  4ca8c9f10ea4403743c51f14b4425b36a2bccade7949930bcda8cbb5ab7290fb
)

package() {
  install -d "${pkgdir}/usr"
  tar -xzf "${_dlfilename}" -C "${pkgdir}/usr"
}
