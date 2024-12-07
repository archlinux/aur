# Maintainer: apropos <jj@toki.la>
# Contributor: TwoFinger
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=koka-bin
pkgver=3.1.2
pkgrel=1
pkgdesc="A strongly typed functional-style language with effect types and handlers"
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
sha256sums=('a62f81b5147c1cd1c41b17ef9a986282839f78d1a4e22baedfbcffc211b3b3a6')

package() {
  install -d "${pkgdir}/usr"
  tar -xzf "${_dlfilename}" -C "${pkgdir}/usr"
}
