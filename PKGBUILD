# Maintainer: James Henderson <james@jarohen.me.uk>
pkgname=bridje-bin
pkgver=0.0.0
pkgrel=1
pkgdesc="Bridje is a statically typed LISP targeting GraalVM, drawing inspiration from both Clojure and Haskell."
arch=('x86_64')
url="https://github.com/bridje/bridje"
license=('custom')
depends=('jdk11-graalvm-bin')

source=("https://github.com/bridje/bridje/releases/download/v${pkgver}/bridje-component-${pkgver}.jar")
sha256sums=('fa21c0a4eaccdc89238a9b22db5fa266e50eb8b0824b3c5d41e1f80e420a2e44')

package() {
    mkdir -p "$pkgdir/usr/lib/jvm/java-11-graalvm/bin"
    cp -a -t "$pkgdir/usr/lib/jvm/java-11-graalvm/" languages/

    chmod +x "$pkgdir/usr/lib/jvm/java-11-graalvm/languages/brj/bin/brj"
    ln -s "$pkgdir/usr/lib/jvm/java-11-graalvm/languages/brj/bin/brj" "$pkgdir/usr/lib/jvm/java-11-graalvm/bin/brj"
}
