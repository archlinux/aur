# Maintainer: TwoFinger
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=koka-bin
pkgver=2.6.0
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
  0568733afb0f286f5e6d89437f92e6a8fd65cd5f3bc4391d9d5c3e958d9c46dd
)

package() {
  install -d "${pkgdir}/usr"
  tar -xzf "${_dlfilename}" -C "${pkgdir}/usr"
}
