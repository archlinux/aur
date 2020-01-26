# Maintainer: James Henderson <james@jarohen.me.uk>
pkgname=bridje-bin
pkgver=0.0.2
pkgrel=1
pkgdesc="Bridje is a statically typed LISP targeting GraalVM, drawing inspiration from both Clojure and Haskell."
arch=('x86_64')
url="https://github.com/bridje/bridje"
license=('custom')
depends=('jdk11-graalvm-bin')

source=("https://github.com/bridje/bridje/releases/download/v${pkgver}/brj-component-${pkgver}.jar")
sha256sums=('1422c534b7e572ea3eaffdb037e621a8a8d97daedbff9a4f6a63c6466075830d')

package() {
    mkdir -p "$pkgdir/usr/lib/jvm/java-11-graalvm/bin"
    cp -a -t "$pkgdir/usr/lib/jvm/java-11-graalvm/" languages/ lib/

    chmod +x "$pkgdir/usr/lib/jvm/java-11-graalvm/languages/brj/bin/brj"
    ln -s "../languages/brj/bin/brj" "$pkgdir/usr/lib/jvm/java-11-graalvm/bin/brj"
}
