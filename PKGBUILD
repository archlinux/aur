# PKGBUILD courtesy of the Arch Wiki	
# Contributor: sudhip n <sudhip at nashi dot u s>
# Original creator: abbi@github : https://github.com/abbbi/nullfsvfs

_pkgname=nullfsvfs
pkgname=nullfsvfs-dkms
pkgver=0.4
pkgrel=2
pkgdesc="nullfsvfs is a null filesystem that acts like /dev/null but can be mounted"
arch=(any)
license=('GPL3')
depends=('dkms')
conflicts=('nullfs-dkms')
source=("https://github.com/abbbi/nullfsvfs/archive/"$pkgver".tar.gz")
md5sums=('af9c1563646f21b18a733801eaf7f4ff')

package() {
  cd "$srcdir"/"$_pkgname"-"$pkgver"

  install -Dm644 debian/nullfsvfs.dkms "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

    echo ${pkgdir}
    sed -e "s/@_PKGBASE@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

  cp -r ./* "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/
}
