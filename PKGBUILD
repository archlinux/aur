# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=o-bin
pkgver=2.49.0
pkgrel=1
pkgdesc='Text editor'
arch=(x86_64)
url='https://github.com/xyproto/o'
license=(BSD)
#depends=(vte3)
conflicts=(o)
source=("https://github.com/xyproto/o/releases/download/v$pkgver/o-$pkgver-linux.tar.xz")
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
sha256sums=('c7e3a5e18e6584c0ee0e5e61ca56dbd595414c5758cfb171b1870785c4f1073c')
b2sums=('f416932afe2f8edfd2f108e2b80ea90518e9825ca7529504b08f7ae610bf687d47a2ea2f9e4af833df54a206719c43745285b14d6bb12625a099330ee65ac4b3')

package() {
  cd o-$pkgver-linux
  install -Dm755 o "$pkgdir/usr/bin/o"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/redblack"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/lighted"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/feedgame"
  install -Dm644 o.1.gz "$pkgdir/usr/share/man/man1/o.1.gz"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  #install -Dm755 ko "$pkgdir/usr/bin/ko"
  #ln -sf /usr/bin/ko "$pkgdir/usr/bin/lo"
}
