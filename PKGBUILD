# Maintainer: zephyrdrh <zephyrdrh(at)gmx(dot)de>
# Contributor: Foppe HEMMINGA <foppe(at)foppe(dot)org>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=tinyuml
pkgver=0.13_02
pkgrel=5
pkgdesc="A tool for creation of UML 2 diagrams with a focus on easy use and a small & stable feature set"
arch=('i686' 'x86_64')
url="https://tinyuml.wordpress.com/about/"
license=('GPL-2.0-only')
depends=('java-runtime')
makedepends=('unzip')
source=("http://sourceforge.net/projects/tinyuml/files/tinyuml/0.13/tinyuml-0.13_02-bin.zip"
        "$pkgname.sh"
        "$pkgname.desktop")
b2sums=('bc4555f038adffd9d1f8204040d5e81d16bfeb6c91a660a420740fb169a84c2311db2cdb039308fad44b3c4faae61f086046bc2a9542896aa4acb264c094bf81'
        'e830d36a3c59d1aa7a3143d1b434726a0f43b4a8b5baf205ac5d7f554af195ef09757be07cbd41e81feba2f6ec0f04928cee50c885dbe36114382eb5c22903f3'
        'a2205276dbcf07ff4de1b08471a875bde31d55732643fb15655c71b166db1d3a87d68e74f9df4148927a32d020b03601bab7a6d287087ed7ada5911eb310b621')

package(){
  cd "$srcdir"/$pkgname-$pkgver-bin/

  install -dm755 "$pkgdir"/usr/share/java/$pkgname/lib
  install -m644 lib/*.jar "$pkgdir"/usr/share/java/$pkgname/lib/

  install -m644 $pkgname.jar "$pkgdir"/usr/share/java/$pkgname/
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm755 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
