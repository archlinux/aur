# PKGBUILD courtesy of the Arch Wiki	
# Contributor: sudhip n <sudhip at nashi dot u s>
# Original creator: abbi@github : https://github.com/abbbi/nullfsvfs

_pkgname=nullfsvfs
pkgname=nullfsvfs-dkms
pkgver=0.12
pkgrel=1
pkgdesc="nullfsvfs is a null filesystem that acts like /dev/null but can be mounted"
arch=(any)
license=('GPL3')
depends=('dkms')
conflicts=('nullfs-dkms')
source=("https://github.com/abbbi/nullfsvfs/archive/"$pkgver".tar.gz")
b2sums=('3b27988da111b219e4e2769335ec3d062e42759735c320f7234f6cd1544afe9bbf22247798ea0ea270b50f6c75d57b6780a451c1b87053965f203a0b40e84cb0')
url="https://github.com/abbbi/nullfsvfs"

package() {
  cd "$srcdir"/"$_pkgname"-"$pkgver"

  install -Dm644 debian/nullfsvfs.dkms "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

    echo ${pkgdir}
    sed -e "s/@_PKGBASE@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

  cp -r ./* "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/
}
