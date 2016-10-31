# Maintainer: Michal Donat <michal@donat.cz>

pkgname=ca-certificates-postsignum
pkgver=20100119
pkgrel=1
pkgdesc="PostSignum root & qualified certificates"
arch=(any)
url="http://www.postsignum.cz/"
license=('unknown')
depends=('ca-certificates-utils')
install='ca-certificates-postsignum.install'

source=('http://www.postsignum.cz/files/ca/postsignum_qca2_root.pem'
        'http://www.postsignum.cz/files/ca/postsignum_qca2_sub.pem'
        'http://www.postsignum.cz/files/ca/postsignum_qca3_sub.pem'
        'http://www.postsignum.cz/files/ca/postsignum_vca2_sub.pem')

md5sums=('e3cda846deea8fd3781fb720c4fcdb5c'
         'b8d77e2ddcc7fabc2d6d65927f1d1ab4'
         'dbaa798aa74aa3422a88e6541a823ead'
         'ef405fb0b7a4721da7cde32bc56b2237')

package() {
  local _certdir="$pkgdir/usr/share/ca-certificates/trust-source/anchors"

  install -Dm644 postsignum_qca2_root.pem "$_certdir/postsignum_qca2_root.pem"
  install -Dm644 postsignum_qca2_sub.pem "$_certdir/postsignum_qca2_sub.pem"
  install -Dm644 postsignum_qca3_sub.pem "$_certdir/postsignum_qca3_sub.pem"
  install -Dm644 postsignum_vca2_sub.pem "$_certdir/postsignum_vca2_sub.pem"
}
