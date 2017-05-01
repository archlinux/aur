pkgname=batch_resolve
pkgver=0.3.4
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

md5sums=('ea7febf0267864f1eea13d40de313ae4' '298c9cfecdf82ac8bbb1e0702e13c030' '72622b8697413db0ba3fb5569d2a0476')
