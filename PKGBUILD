# Maintainer: qwjyh <urataw421@gmail.com>
# Contributor: apropos <jj@toki.la>
# Contributor: TwoFinger
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=koka-bin
pkgver=3.2.3
pkgrel=1
pkgdesc="A strongly typed functional-style language with effect types and handlers"
arch=(x86_64)
url="https://github.com/koka-lang/koka"
license=(Apache-2.0)
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
sha256sums=('e82a4b497f1f8791ee171d06c45293ba16432e485d645ddd9688bafa6ccde5a5')

package() {
  cd $srcdir
  install -Dm755 "bin/koka" "${pkgdir}/usr/bin/koka"
  install -d "${pkgdir}/usr/lib"
  cp -r lib/koka "${pkgdir}/usr/lib/"
  install -d "${pkgdir}/usr/share/koka"
  cp -r "share/koka" "${pkgdir}/usr/share/"
}
