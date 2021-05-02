# Maintainer: James Henderson <james@jarohen.me.uk>
pkgname=bridje-bin
pkgver=0.0.3
pkgrel=1
pkgdesc="Bridje is a statically typed LISP targeting GraalVM, drawing inspiration from both Clojure and Haskell."
arch=('any')
url="https://github.com/bridje/bridje"
license=('custom')
depends=('jdk11-graalvm-bin')

source=("https://github.com/bridje/bridje/releases/download/v${pkgver}/brj-component.jar")
sha256sums=('0287b56ca1277b8c18f021dd914aaa686d4a8174aad872eefc6d1d734478533b')

package() {
    mkdir -p "$pkgdir/usr/lib/jvm/java-11-graalvm/bin"
    cp -a -t "$pkgdir/usr/lib/jvm/java-11-graalvm/" languages/ lib/

    chmod +x "$pkgdir/usr/lib/jvm/java-11-graalvm/languages/brj/bin/brj"
    ln -s "../languages/brj/bin/brj" "$pkgdir/usr/lib/jvm/java-11-graalvm/bin/brj"
}
