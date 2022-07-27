# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=o-bin
pkgver=2.55.0
pkgrel=2
pkgdesc='Text editor, IDE and gdb frontend (CLI only)'
arch=(aarch64 armv6 armv7 riscv64 x86_64)
url='https://github.com/xyproto/o'
license=(BSD)
conflicts=(o)
source=("https://github.com/xyproto/o/releases/download/v$pkgver/o-$pkgver-linux_${CARCH}_static.tar.xz")
optdepends=('asciidoctor: for writing man pages'
            'agda: for compiling Agda'
            'astyle: for formatting C#'
            'autopep8: for formatting Python'
            'brittany: for formatting Haskell'
            'clang: for formatting C++ code with clang-format'
            'clojure: for compiling Clojure'
            'crystal: for compiling Crystal'
            'cxx: for compiling C and C++'
            'fpc: for compiling Object Pascal'
            'fstabfmt: for formatting /etc/fstab'
            'gdb: for debugging C'
            'gdc: for compiling D'
            'ghc: for compiling Haskell'
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
            'v: for compiling and formatting V'
            'yasm: for compiling Assembly'
            'zig: for compiling and formatting Zig')
sha256sums=('81e2ac6a6c6558b42eb42f983ba5342423ef7d15cb5c1eefc510e9d83569fa96')
b2sums=('c24d3bf45a0f0fd17f31a76c8fc6394d7af44e1d3061dc8dcfc484aa647f622f6950a02bcedf2ce33daffa8522764e443faf900929439db99271bd0aeb5594d6')

package() {
  cd o-$pkgver-linux_${CARCH}_static
  install -Dm755 o "$pkgdir/usr/bin/o"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/edit"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/feedgame"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/lighted"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/redblack"
  install -Dm644 o.1.gz "$pkgdir/usr/share/man/man1/o.1.gz"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
