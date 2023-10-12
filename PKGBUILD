# Maintainer: TwoFinger
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=koka-bin
pkgver=2.4.2
pkgrel=1
pkgdesc="Koka: a function-oriented language with effect inference"
arch=('x86_64')
url="https://github.com/koka-lang/koka"
license=('Apache')
options=('!strip')
depends=('gcc' 'make')
optdepends=(
  'clang: for C backend compiler'
  'nodejs: for JavaScript target'
  'emscripten: for WebAssembly target'
  'wasmtime: for running WebAssembly modules'
  'mono: for C# target'
)
provides=('koka')
conflicts=('koka')
_dlfilename="koka-v${pkgver}-linux-x64.tar.gz"
source=(
  "https://github.com/koka-lang/koka/releases/download/v${pkgver}/${_dlfilename}"
)
noextract=("${_dlfilename}")
sha256sums=(
  '7d544c7d7fbd22481949d5644cbe19eb3bae9431b7a8537bea02b0bc55a28322'
)

package() {
  install -d "${pkgdir}/usr"
  tar -xzf "${_dlfilename}" -C "${pkgdir}/usr"
}
