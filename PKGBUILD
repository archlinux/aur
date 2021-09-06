# PKGBUILD courtesy of the Arch Wiki	
# Contributor: sudhip n <sudhip at nashi dot u s>
# Original creator: abbi@github : https://github.com/abbbi/nullfsvfs

_pkgname=nullfsvfs
pkgname=nullfsvfs-dkms
pkgver=0.9
pkgrel=1
pkgdesc="nullfsvfs is a null filesystem that acts like /dev/null but can be mounted"
arch=(any)
license=('GPL3')
depends=('dkms')
conflicts=('nullfs-dkms')
source=("https://github.com/abbbi/nullfsvfs/archive/"$pkgver".tar.gz")
b2sums=('0d17810e7e9661f3316268691b4c71ceb44274fc392874187f548f4e5974c9ef7ee10a08b854b9c3a0f58c4cf9fa9432d2a91bf709ac3aa636c00cc76d1bad32')

package() {
  cd "$srcdir"/"$_pkgname"-"$pkgver"

  install -Dm644 debian/nullfsvfs.dkms "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

    echo ${pkgdir}
    sed -e "s/@_PKGBASE@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

  cp -r ./* "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/
}
