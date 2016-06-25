# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Past maintainer: F. Miñano <cicely@algofacil.info>
pkgname=mindi-busybox
pkgver=1.18.5
pkgrel=5
pkgdesc="This package provides a busybox version suited for Mindi"
arch=('i686' 'x86_64')
url="http://www.mondorescue.org/"
license=('GPL')
depends=(gcc)

#There are two official mirrors. If one is not working try the other. The muskokamug.org seems faster.
source=("ftp://ftp.mondorescue.org/src/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('f7962b4b327536437d1ec91821ddf660afff74d84de6268ce026593c233e0ecb1c2b611c4e2a9132d9803ebe22ebdc87b965d8c2f6f9a0efe27939ce55033bf7'
            'SKIP')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make oldconfig || return 1
  make busybox || return 1
  make CONFIG_PREFIX=${pkgdir}/usr/lib/mindi/rootfs install
}

