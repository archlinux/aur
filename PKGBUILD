# PKGBUILD courtesy of the Arch Wiki	
# Contributor: sudhip n <sudhip at nashi dot u s>
# Original creator: abbi@github : https://github.com/abbbi/nullfsvfs

_pkgname=nullfsvfs
pkgname=nullfsvfs-dkms
pkgver=0.8
pkgrel=1
pkgdesc="nullfsvfs is a null filesystem that acts like /dev/null but can be mounted"
arch=(any)
license=('GPL3')
depends=('dkms')
conflicts=('nullfs-dkms')
source=("https://github.com/abbbi/nullfsvfs/archive/"$pkgver".tar.gz")
b2sums=('9b8d322b9827e54c6a30a1f4623dcc8fe98026e2a359801935e3d19bd637544ad2f428a9283a1ebd902870732e4439afc5244d40b3ff5749cf6f0da37728e25a')

package() {
  cd "$srcdir"/"$_pkgname"-"$pkgver"

  install -Dm644 debian/nullfsvfs.dkms "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

    echo ${pkgdir}
    sed -e "s/@_PKGBASE@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

  cp -r ./* "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/
}
