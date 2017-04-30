pkgname=batch_resolve
pkgver=0.3.3
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

md5sums=('dd7d46d9ae61382edecbf88333510067' '172cd4b030379c5cefcacd3763ecc915' 'b953b1089ccf581f9066b4d16c41c7c7')
