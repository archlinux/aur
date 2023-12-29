# Maintainer: fanjiang <prof.fan@foxmail.com>
# Maintainer: soloturn@gmail.com
# Contributor: Theo Tosini <theo.tosini@theoduino.me>
# Contributor: Gábor Sebestyén <segabor@gmail.com>
# Contributor: Andrew Sun <adsun701@gmail.com>

_pkgname="swift-language"
pkgname="$_pkgname-git"
pkgver=2023.12.21a.r6.gf08f86c7161
pkgrel=1
pkgdesc="The Swift programming language, taken directly from the Apple repository"
arch=('x86_64')
url="https://swift.org/"
license=('Apache-2.0')
depends=('icu' 'libedit' 'libxml2' 'python' 'libbsd' 'ncurses' )
makedepends=('clang' 'cmake' 'git' 'lld' 'llvm' 'ninja' 'patch' 'python-six' 'rsync' 'swig')

provides=("$_pkgname")
conflicts=("$_pkgname")

source=(
  'git+https://github.com/apple/swift#branch=main'
  '0001-arch-aur-patches.patch'
  '0002-stdint.patch'

  'apple-indexstore-db'::'git+https://github.com/apple/indexstore-db#branch=main'
  'apple-llvm-project'::'git+https://github.com/apple/llvm-project#branch=stable/20220421'
  'apple-sourcekit-lsp'::'git+https://github.com/apple/sourcekit-lsp#branch=main'
  'swift-argument-parser'::'git+https://github.com/apple/swift-argument-parser#commit=1.2.3'
  'swift-asn1'::'git+https://github.com/apple/swift-asn1#commit=1.0.0'
  'swift-atomics'::'git+https://github.com/apple/swift-atomics#commit=1.0.2'
  'swift-certificates'::'git+https://github.com/apple/swift-certificates#commit=0.6.0'
  'swift-cmark'::'git+https://github.com/apple/swift-cmark#branch=gfm'
  'swift-cmark'::'git+https://github.com/apple/swift-cmark#branch=main'
  'swift-collections'::'git+https://github.com/apple/swift-collections#commit=1.0.1'
  'swift-corelibs-foundation'::'git+https://github.com/apple/swift-corelibs-foundation#branch=main'
  'swift-corelibs-libdispatch'::'git+https://github.com/apple/swift-corelibs-libdispatch#branch=main'
  'swift-corelibs-xctest'::'git+https://github.com/apple/swift-corelibs-xctest#branch=main'
  'swift-crypto'::'git+https://github.com/apple/swift-crypto#commit=2.5.0'
  'swift-docc'::'git+https://github.com/apple/swift-docc#branch=main'
  'swift-docc-render-artifact'::'git+https://github.com/apple/swift-docc-render-artifact#branch=main'
  'swift-docc-symbolkit'::'git+https://github.com/apple/swift-docc-symbolkit#branch=main'
  'swift-driver'::'git+https://github.com/apple/swift-driver#branch=main'
  'swift-experimental-string-processing'::'git+https://github.com/apple/swift-experimental-string-processing#branch=main'
  'swift-format'::'git+https://github.com/apple/swift-format#branch=main'
  'swift-installer-scripts'::'git+https://github.com/apple/swift-installer-scripts#branch=main'
  'swift-integration-tests'::'git+https://github.com/apple/swift-integration-tests#branch=main'
  'swift-llbuild'::'git+https://github.com/apple/swift-llbuild#branch=main'
  'swift-llvm-bindings'::'git+https://github.com/apple/swift-llvm-bindings#branch=stable/20220421'
  'swift-lmdb'::'git+https://github.com/apple/swift-lmdb#branch=main'
  'swift-markdown'::'git+https://github.com/apple/swift-markdown#branch=main'
  'swift-nio'::'git+https://github.com/apple/swift-nio#commit=2.31.2'
  'swift-nio-ssl'::'git+https://github.com/apple/swift-nio-ssl#commit=2.15.0'
  'swift-numerics'::'git+https://github.com/apple/swift-numerics#commit=1.0.1'
  'swift-package-manager'::'git+https://github.com/apple/swift-package-manager#branch=main'
  'swift-stress-tester'::'git+https://github.com/apple/swift-stress-tester#branch=main'
  'swift-syntax'::'git+https://github.com/apple/swift-syntax#branch=main'
  'swift-system'::'git+https://github.com/apple/swift-system#commit=1.1.1'
  'swift-tools-support-core'::'git+https://github.com/apple/swift-tools-support-core#branch=main'
  'swift-xcode-playground-support'::'git+https://github.com/apple/swift-xcode-playground-support#branch=main'
  'yams'::'git+https://github.com/jpsim/Yams#commit=5.0.1'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'

  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)


# By default makepkg runs strip on binaries. This causes issues with the Swift REPL.
# from https://github.com/RLovelett/swift-aur/blob/master/PKGBUILD
# termux had no trouble up to now, strip all executables and shared objects:
# https://github.com/termux/termux-packages/blob/master/scripts/build/termux_step_massage.sh#L24
# would be cool to not strip only the ones which really are necessary, but how?
options=(!strip)

prepare () {
  ln -sfP 'apple-indexstore-db' 'indexstore-db'
  ln -sfP 'apple-llvm-project' 'llvm-project'
  ln -sfP 'apple-sourcekit-lsp' 'sourcekit-lsp'
  ln -sfP 'swift-argument-parser' 'argument-parser'
  ln -sfP 'swift-asn1' 'asn1'
  ln -sfP 'swift-atomics' 'atomics'
  ln -sfP 'swift-certificates' 'certificates'
  ln -sfP 'swift-cmark' 'cmark'
  ln -sfP 'swift-cmark' 'cmark'
  ln -sfP 'swift-collections' 'collections'
  ln -sfP 'swift-corelibs-foundation' 'corelibs-foundation'
  ln -sfP 'swift-corelibs-libdispatch' 'corelibs-libdispatch'
  ln -sfP 'swift-corelibs-xctest' 'corelibs-xctest'
  ln -sfP 'swift-crypto' 'crypto'
  ln -sfP 'swift-docc' 'docc'
  ln -sfP 'swift-docc-render-artifact' 'docc-render-artifact'
  ln -sfP 'swift-docc-symbolkit' 'docc-symbolkit'
  ln -sfP 'swift-driver' 'driver'
  ln -sfP 'swift-experimental-string-processing' 'experimental-string-processing'
  ln -sfP 'swift-format' 'format'
  ln -sfP 'swift-installer-scripts' 'installer-scripts'
  ln -sfP 'swift-integration-tests' 'integration-tests'
  ln -sfP 'swift-llbuild' 'llbuild'
  ln -sfP 'swift-llvm-bindings' 'llvm-bindings'
  ln -sfP 'swift-lmdb' 'lmdb'
  ln -sfP 'swift-markdown' 'markdown'
  ln -sfP 'swift-nio' 'nio'
  ln -sfP 'swift-nio-ssl' 'nio-ssl'
  ln -sfP 'swift-numerics' 'numerics'
  ln -sfP 'swift-package-manager' 'package-manager'
  ln -sfP 'swift-stress-tester' 'stress-tester'
  ln -sfP 'swift-syntax' 'syntax'
  ln -sfP 'swift-system' 'system'
  ln -sfP 'swift-tools-support-core' 'tools-support-core'
  ln -sfP 'swift-xcode-playground-support' 'xcode-playground-support'

  ( cd swift && patch -p1 -i "$srcdir/0001-arch-aur-patches.patch" )
  ( cd llvm-project && patch -p1 -F100 -i "$srcdir/0002-stdint.patch" )
}

pkgver() {
  cd "swift"
  git describe --long | sed -E 's/^[^0-9]+//;s/-([^0-9]+)/\1/;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  # Fix /usr/include error
  find "$srcdir/swift/stdlib/public/SwiftShims" -type f -print0 | xargs -0 sed -i 's|/usr/include/x86_64-linux-gnu|/usr/include|g'
  find "$srcdir/llvm-project/clang" -type f -print0 | xargs -0 sed -i 's|/usr/include/x86_64-linux-gnu|/usr/include|g'
  find "$srcdir/llvm-project/clang-tools-extra" -type f -print0 | xargs -0 sed -i 's|/usr/include/x86_64-linux-gnu|/usr/include|g'

  # By default in /etc/makepkg.conf this is "-D_FORTIFY_SOURCE=2"
  # Which will break `compiler-rt`
  unset CPPFLAGS
  export DISTCC_HOSTS='--randomize localhost red,cpp,lzo green,cpp,lzo blue,cpp,lzo'

  python swift/utils/build-script --preset=buildbot_linux,no_test install_destdir="$srcdir/destdir"
}

package() {
  ls -la "$srcdir/destdir"
  mv "$srcdir/destdir"/* "$pkgdir"
}

# vim:set ts=2 sw=2 et:
