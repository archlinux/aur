# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=o-bin
pkgver=2.56.0
pkgrel=1
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
            'elm: for compiling Elm'
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
sha256sums=('470f71bd8248cce41868e654f9352d00b8d9ba6069ac57bf209c7ad4e832614e')
b2sums=('a31b670210539f3e418a9d0e1d3fff135a8b0d52b4295a5e353c55374991a99b06ad2b69b0d88b31af9738f324200cbedefdeb0dda70ca2afae23f0c15187c81')

package() {
  cd o-$pkgver-linux_${CARCH}_static
  install -Dm755 o "$pkgdir/usr/bin/o"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/edit"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/feedgame"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/vs"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/redblack"
  install -Dm644 o.1.gz "$pkgdir/usr/share/man/man1/o.1.gz"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
