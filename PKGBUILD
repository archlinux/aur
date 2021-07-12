# Maintainer: Pierre Penninckx <ibizapeanut@gmail.com>

pkgname='haskell-godaddy'
pkgver=0.0.0.6
pkgrel=1
pkgdesc='Command-line interface to configure a domain managed by Godaddy.'
arch=('any')
url='https://github.com/ibizaman/haskell-godaddy'
license=('GPL3')
depends=('numactl')
source=(
    https://github.com/ibizaman/haskell-godaddy/releases/download/${pkgver}/godaddy.zip
	https://raw.githubusercontent.com/ibizaman/haskell-godaddy/${pkgver}/bin/godaddy-certbot-dns01-auth-hook
	https://raw.githubusercontent.com/ibizaman/haskell-godaddy/${pkgver}/bin/godaddy-certbot-dns01-cleanup-hook
)
sha512sums=('815ee1ad521d3142683d0597f36f0cab12d7760acacb84fdd808589a18e9b54af4f5fdda556407cd68286aae94f3e99230fbff5ebd9db2b638fcafad7909244c'
            '99fe6663ba57e41bdfd9f7f79086984e95cc9dae383c96eeb18a1702bbe67e5ba24ac2246903a570f13035cb6f1cd8b0ddfe4b6d17ece044da80748e1c9ad247'
            'ebfc4517a10f140f31a65b83a708d9feedef6ed49c4f09bd1a7ea07cfc733b1cfcedbe2a8dc120260ee04fea4095a6d4e83e98e87f7e02015f591002284cd79b')

package() {
  install -Dm0755 godaddy "$pkgdir"/usr/bin/godaddy
  install -Dm0755 godaddy-certbot-dns01-auth-hook "$pkgdir"/usr/bin/godaddy-certbot-dns01-auth-hook
  install -Dm0755 godaddy-certbot-dns01-cleanup-hook "$pkgdir"/usr/bin/godaddy-certbot-dns01-cleanup-hook
}
