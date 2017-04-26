pkgname=batch_resolve
pkgver=0.3.2
pkgrel=1
pkgdesc="Fast asynchronous DNS resolver"
arch=('x86_64')
url="https://github.com/mersinvald/batch_resolve"
license=('MIT')
depends=('openssl')

URL=$(curl -s https://api.github.com/repos/mersinvald/batch_resolve/releases/tags/$pkgver | jq -r ".assets[] | select(.name | test(\"${batch_resolve}\")) | .browser_download_url")
source=($URL)

package() {
  mkdir -p $pkgdir/usr/bin/
  install -m 755 $srcdir/batch_resolve $pkgdir/usr/bin/
}
md5sums=('8a38046d20988ec24ea7e92b7d7ca340')
