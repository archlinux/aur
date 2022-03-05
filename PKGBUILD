# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Contributor : grimsock <lord.grimsock at gmail dot com>
# Contributor : Joel Sevilleja Febrer Joel7987[at].gmail.com


pkgbase=htmlunit
pkgname=("$pkgbase" "$pkgbase-doc")

pkgver=2.59.0
pkgrel=1

pkgdesc='Headless HTTP webclient for Java'
arch=('any')
url="http://$pkgbase.sourceforge.net"
license=('Apache')

#source=("http://sourceforge.net/projects/$pkgbase/files/$pkgbase/$pkgver/$pkgbase-$pkgver-bin.zip")
source=("https://github.com/$pkgbase/$pkgbase/releases/download/$pkgver/$pkgbase-$pkgver-bin.zip")
sha256sums=('cef41ed4358ae5ff3d6f5a0e5264248040aeda385bc7ad7dc3ca60ecc64a3089')


package_htmlunit() {
  depends=('java-runtime')
  optdepends=("$pkgbase-doc: API documentation")

  cd "$pkgbase-$pkgver/lib"
  install -Dm644 *.jar -t"$pkgdir/usr/share/java/$pkgbase/"
}

package_htmlunit-doc() {
  install -dm755 "$pkgdir/usr/share/doc"
  cp -a --no-preserve=o "$pkgbase-$pkgver/apidocs" "$pkgdir/usr/share/doc/$pkgbase"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
