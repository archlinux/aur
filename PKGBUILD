# Maintainer: courk <courk at courk dot fr>
pkgname=kaitai-struct-compiler
pkgver=0.5
pkgrel=1
pkgdesc="Kaitai Struct Compiler: Compiler for the Kaitai declarative binary format parsing language"
arch=(any)
url="http://kaitai.io/"
license=('GPL3')
depends=("java-runtime")
optdepends=()
source=("$pkgname-$pkgver.zip::https://bintray.com/kaitai-io/universal/download_file?file_path=$pkgver%2F$pkgname-$pkgver.zip" "kaitai-struct-compiler")
sha1sums=("2df2f889233df6856ed98f0ab453bafe8c736512"
          "834551bc7e7b4ef645614a6a0d24c550a46dde74")

package() {
  cd "$srcdir/$pkgname-$pkgver/lib/"
  for f in *.jar
  do
    install -D -m 644 "$f" "$pkgdir/usr/share/java/$pkgname/$f"
  done
  cd "$srcdir"
  install -D -m 755 "kaitai-struct-compiler" "$pkgdir/usr/bin/kaitai-struct-compiler"
}

# vim:set ts=2 sw=2 et:
