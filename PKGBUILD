# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-keyring
pkgver=20230504
pkgrel=2
pkgdesc='ALHP PGP keyring'
arch=(any)
url='https://somegit.dev/ALHP/alhp-keyring'
license=(GPL)
install=$pkgname.install
source=(https://f.alhp.dev/$pkgname/${pkgname}-${pkgver}.tar.gz{,.sig})
b2sums=('14ea5ad83c3a98b7369e619b05a331a16e173108df763698bdbc1bd3e845c3955e7ec7698f838d38f048f090c9ee1065eea2375a9d9b5207021f9b361f15ff5f'
        'SKIP')
validpgpkeys=('2E3B2B05A332A7DB9019797848998B4039BED1CA')  # Giovanni Harting <g.harting@mailstash.org>

package() {
  cd $pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
