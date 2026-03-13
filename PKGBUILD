# Maintainer: Hyacinthe Cartiaux <hyacinthe dot cartiaux at free dot fr>

pkgname=cvmfs-config-eessi
pkgver=0.5.0
pkgrel=3
pkgdesc="CernVM-FS configuration for the EESSI project (European Environment for Scientific Software Installations)"
arch=('any')
url="https://github.com/EESSI/filesystem-layer"
license=('GPL-2.0')
depends=('cvmfs')
install=cvmfs-config-eessi.install
source=("https://github.com/EESSI/filesystem-layer/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar")
sha256sums=('defd151b6bcd3b53e3b941853bb31ca869360e3d697f1ddbdceda34f1de42857')

package() {
  cd "$srcdir"
  cp -a etc "$pkgdir/"
  install -dm755 "$pkgdir/etc/cvmfs/config.d/"
  echo 'CVMFS_HTTP_PROXY="${CVMFS_HTTP_PROXY:=DIRECT}"' > "$pkgdir/etc/cvmfs/config.d/software.eessi.io.conf"
}
