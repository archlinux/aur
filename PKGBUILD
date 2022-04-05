# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=o-bin
pkgver=2.49.1
pkgrel=1
pkgdesc='Text editor (terminal only)'
arch=(x86_64)
url='https://github.com/xyproto/o'
license=(BSD)
conflicts=(o)
source=("https://github.com/xyproto/o/releases/download/v$pkgver/o-$pkgver-linux_amd64.tar.xz")
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
            'gdc: for compiling D'
            'ghc: for compiling Haskell'
            'google-java-format: for formatting Java'
            'guessica: for updating PKGBUILD files'
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
sha256sums=('bc92342c0a9eb8c69af7eb05f31d0a6df8a1f729ec35e1a98d27b52f8b7e0a6e')
b2sums=('faf76e2dd7693d116bec9dbd01a58249faa46b0470630e2444c72f414736baa2da19148c4f779193e392880aff885842bb473b55bcb28c3196db6a012746c12b')

package() {
  cd o-$pkgver-linux_amd64
  install -Dm755 o "$pkgdir/usr/bin/o"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/redblack"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/lighted"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/feedgame"
  install -Dm644 o.1.gz "$pkgdir/usr/share/man/man1/o.1.gz"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
