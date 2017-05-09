pkgname=batch_resolve
pkgver=0.3.5
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


md5sums=('c1886fb865d43eaddffffa3d9fb4c048' '53228d6e7e83d2f3a8402d3578f02fb0' '02454428fdb5ef2a122249b9e6bb30ff')
