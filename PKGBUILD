# Maintainer: Barry Smith <brrtsm@gmail.com>
# Contributor: Sirat18 <aur@sirat18.de>
# Contributor: ekse <ekse.0x@gmail.com>
pkgname=halberd
pkgver=0.2.4
pkgrel=6
pkgdesc="Tool to discover HTTP load balancers"
url='https://github.com/jmbr/halberd'
license=("GPL")
depends=('python2')
arch=('any')
provides=('halberd')
conflicts=('halberd-git')
makedepends=('python2-setuptools')
source=("https://github.com/jmbr/halberd/archive/${pkgver}.tar.gz"
    "${pkgname}.1")
sha512sums=('133eb683f46a078b45023198746c583ae96cd54b75eedbc46a3d49675307927a7d9f05383e312b589fa5efe79e68c75fcd1d31649df2852ca27cc5d30c307672'
            'db825696a23c605ce487c8a4c7f11d2b7d1e9ee5cee4447fea9f897d838b1ce1d60609d5800ad4d4128119c81e871bea90013cf2858dd4fdec5ee98c973e49f6')

package() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/man/man1/"
  install -D -m644 "${pkgname}.1" "${srcdir}/${pkgname}-${pkgver}/man/man1/${pkgname}.1"

  cd "${srcdir}/$pkgname-$pkgver"
  python2 setup.py install --root "${pkgdir}" --optimize=1
}
