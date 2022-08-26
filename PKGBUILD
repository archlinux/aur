# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>

pkgname=devuan-keyring
pkgver=2017.10.03
pkgrel=1
pkgdesc="GnuPG archive keys of the Devuan archive"
arch=('any')
url="http://pkgmaster.devuan.org/devuan/pool/main/d/devuan-keyring/"
license=('GPL')
depends=('gnupg')
source=("http://pkgmaster.devuan.org/devuan/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha512sums=("f7353c2567436526ef757a828eae2db288b8cfc98f0d0dcb657ae6bd484b3ba4fa4b6d736faa713bfee2247e7ec35200a319e7b684b970cf3f9853f29ab8d4f5")

package() {
  cd source
  install -Dm644 keyrings/*-{keyring,keys}.gpg -t "$pkgdir"/usr/share/keyrings/
  install -Dm644 keyrings/$pkgname-*.gpg -t "$pkgdir"/etc/apt/trusted.gpg.d/
}
