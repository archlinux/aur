# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>

pkgname=devuan-keyring
pkgver=2017.10.03
pkgrel=2
pkgdesc="GnuPG archive keys of the Devuan archive. Suggested for use with debootstrap."
arch=('any')
url="https://pkgmaster.devuan.org/devuan/pool/main/d/devuan-keyring/"
license=('GPL')
depends=('gnupg')
source=("https://pkgmaster.devuan.org/devuan/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=("c980267af4c9ccff49fb16e116d60a5ea7ba6b2141803313af5361c2d2d16dfe")

package() {
  cd source
  install -Dm644 keyrings/*-{keyring,keys}.gpg -t "$pkgdir"/usr/share/keyrings/
  install -Dm644 keyrings/$pkgname-*.gpg -t "$pkgdir"/etc/apt/trusted.gpg.d/
}
