# Maintainer: Barry Smith <brrtsm[at]gmail[dot]com>
# Contributor: Dusan Maliarik <dusan.maliarik[at]gmail[dot]com>

pkgname=imgur
pkgver=9
pkgrel=2
pkgdesc="Upload image to imgur.com image sharing service."
arch=('any')
url="http://imgur.com/apps"
license=('GPL')
depends=('curl' 'bash')
optdepends=('xsel: clipboard support' 'xclip: clipboard support')
makedepends=()
groups=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/tremby/${pkgname}.sh/archive/v${pkgver}.tar.gz")
sha512sums=('3b603954c0bb6ecc0a76223a945a51bfdd2351b80a65e3d63ad1483c50836009a80bd130efc28926ac60b3759324aff2d3bc3fb2f957a38c9c804eb427ff35c6')

build() {
  cd "${srcdir}/${pkgname}.sh-${pkgver}"
  mv imgur.sh imgur
  chmod +x imgur
}

package() {
  mkdir -p $pkgdir/usr/bin
  cp "${srcdir}/${pkgname}.sh-${pkgver}/${pkgname}" $pkgdir/usr/bin
}
