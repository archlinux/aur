# Maintainer: swearchnick <swearchnick[at]gmail[dot]com>

pkgname=bbk-cli-bin
pkgver=0.3.8
pkgrel=1
pkgdesc="Measurement client for Bredbandskollen"
arch=('x86_64' 'armv7h' 'armv8h')
url='https://support.bredbandskollen.se/support/solutions/articles/1000245679-bredbandskollen-f%C3%B6r-linux'
license=('custom: Copyright (c) 2017 Stiftelsen för Internetinfrastruktur <iis.se>')
source_x86_64=("http://beta1.bredbandskollen.se/download/bbk-cli_0.3.8_amd64.deb")
source_armv7h=("http://beta1.bredbandskollen.se/download/bbk-cli_0.3.8_armhf.deb")
source_armv8h=("http://beta1.bredbandskollen.se/download/bbk-cli_0.3.8_armhf.deb")
sha256sums_x86_64=('9f205447da6c5c0f114e94e45a88a3e35febc63b8b9002e692414348ee4ce6fb')
sha256sums_armv7h=('1cb2c8cb62787f00defca0667c646c8833045de09c0de8ee5e0a301ba40c0ee8')
sha256sums_armv8h=('1cb2c8cb62787f00defca0667c646c8833045de09c0de8ee5e0a301ba40c0ee8')

prepare (){

 tar -C "$srcdir" -xvf "$srcdir/data.tar.gz"

}

package() {

 install -Dm755 "$srcdir/usr/bin/bbk_cli" "$pkgdir/usr/bin/bbk_cli"

 install -Dm644 "$srcdir/usr/share/doc/bbk-cli/README" "$pkgdir/usr/share/doc/$pkgname/README"
 install -Dm644 "$srcdir/usr/share/doc/bbk-cli/copyright" "$pkgdir/usr/share/licenses/$pkgname/copyright"

}
