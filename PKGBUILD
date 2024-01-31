# Maintainer: TwoFinger
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=koka-bin
pkgver=3.0.4
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
  9160e77b56c5e8aae7d43536bfacb2e596a81b709d612e9d5746e439652b64ce
)

package() {
  install -d "${pkgdir}/usr"
  tar -xzf "${_dlfilename}" -C "${pkgdir}/usr"
}
