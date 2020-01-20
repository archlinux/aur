# Maintainer: James Henderson <james@jarohen.me.uk>
pkgname=bridje-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="Bridje is a statically typed LISP targeting GraalVM, drawing inspiration from both Clojure and Haskell."
arch=('x86_64')
url="https://github.com/bridje/bridje"
license=('custom')
depends=('jdk11-graalvm-bin')

source=("https://github.com/bridje/bridje/releases/download/v${pkgver}/brj-component-${pkgver}.jar")
sha256sums=('f30a48f03a6b007f1769958ca235e358c99eef2bc7a5ff59c0028d33267d4af8')

package() {
    mkdir -p "$pkgdir/usr/lib/jvm/java-11-graalvm/bin"
    cp -a -t "$pkgdir/usr/lib/jvm/java-11-graalvm/" languages/

    chmod +x "$pkgdir/usr/lib/jvm/java-11-graalvm/languages/brj/bin/brj"
    ln -s "../languages/brj/bin/brj" "$pkgdir/usr/lib/jvm/java-11-graalvm/bin/brj"
}
