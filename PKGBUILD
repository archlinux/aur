# Maintainer: Hyacinthe Cartiaux <hyacinthe dot cartiaux at free dot fr>

pkgname=cvmfs-config-eessi
pkgver=0.5.0
pkgrel=3
pkgdesc='CernVM-FS configuration for the EESSI project (European Environment for Scientific Software Installations)'
arch=('any')
url='https://github.com/EESSI/filesystem-layer'
license=('GPL-2.0-only')
depends=('cvmfs')
install=cvmfs-config-eessi.install
source=("https://github.com/EESSI/filesystem-layer/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar"
        "software.eessi.io.conf")
sha256sums=('defd151b6bcd3b53e3b941853bb31ca869360e3d697f1ddbdceda34f1de42857'
            '9c213aa5af232f3884120a94181a4775606ffe252c52753cc88bdbb45ca5a055')
backup=('etc/cvmfs/config.d/software.eessi.io.conf')

package() {
  cp -a etc "${pkgdir}/"
  install -dm755 "${pkgdir}/etc/cvmfs/config.d"
  install -m644 software.eessi.io.conf "${pkgdir}/etc/cvmfs/config.d/"
}
