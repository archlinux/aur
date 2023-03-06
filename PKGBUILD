# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=orbiton-bin
pkgver=2.60.3
pkgrel=1
pkgdesc='Text editor, IDE and gdb frontend (CLI only)'
arch=(aarch64 armv6 armv7 riscv64 x86_64)
url='https://github.com/xyproto/orbiton'
license=(BSD)
conflicts=(o o-bin orbiton)
replaces=(o-bin)
provides=(o)
source=("https://github.com/xyproto/orbiton/releases/download/v$pkgver/orbiton-$pkgver-linux_${CARCH}_static.tar.xz")
optdepends=('asciidoctor: for writing man pages'
            'agda: for compiling Agda'
            'astyle: for formatting C#'
            'autopep8: for formatting Python'
            'brittany: for formatting Haskell'
            'clang: for formatting C++ code with clang-format'
            'clojure: for compiling Clojure'
            'crystal: for compiling Crystal'
            'cxx: for compiling C and C++'
            'elm-bin: for compiling Elm'
            'fpc: for compiling Object Pascal'
            'fstabfmt: for formatting /etc/fstab'
            'gdb: for debugging C'
            'gdc: for compiling D'
            'ghc: for compiling Haskell'
            'godot: for using GDScript'
            'google-java-format: for formatting Java'
            'guessica: for updating PKGBUILD files'
            'hare: for compiling Hare'
            'jad: for decompiling .class files on the fly'
            'java-environment: for compiling Java'
            'kotlin: for compiling Kotlin'
            'ktlint: for formatting Kotlin'
            'lua: for compiling Lua'
            'lua-format: for formatting Lua'
            'mlton: for compiling Standard ML'
            'mono: for compiling C#'
            'nasm: for compiling Assembly'
            'ocaml: for compiling and formatting OCaml'
            'odin: for compiling Odin'
            'perl-tidy: for formatting Perl'
            'pandoc-bin: for exporting Markdown to PDF'
            'prettier: for formatting JavaScript, TypeScript and CSS'
            'rustup: for compiling and formatting Rust'
            'scala: for compiling Scala'
            'scdoc: for writing man pages'
            'shfmt: for formattig Shell scripts'
            'tidy: for formatting HTML'
            'vlang: for compiling and formatting V'
            'yasm: for compiling Assembly'
            'zig: for compiling and formatting Zig')
sha256sums=('f774d01a422f624185278f2b06c7fb2b00fd098266930062735b08be20d9e1ee')
b2sums=('a2b7d391b1a343c74b264c8271af7cb934bbf40ec728bbef958a292cd28435ad2b75c55690f30a0f977fa12f06d5bb1fd66a1d7de57de9cb39a6aad3a2fd81c5')

package() {
  cd orbiton-$pkgver-linux_${CARCH}_static

  install -Dm755 o "$pkgdir/usr/bin/o"
  install -Dm644 o.1.gz "$pkgdir/usr/share/man/man1/o.1.gz"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Recommended symlinks for Orbiton
  ln -sf /usr/bin/o "$pkgdir/usr/bin/li"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/redblack"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/sw"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/edi"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/vs"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/feedgame"
}
