# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=sanoid
pkgver=1.4.8
pkgrel=1
pkgdesc="Sanoid is a policy-driven snapshot management tool for ZFS filesystems."
arch=('any')
url='https://github.com/jimsalterjrs/sanoid'
license=('GPL')
backup=('etc/sanoid/sanoid.conf')
depends=('perl' 'perl-config-inifiles')
optdepends=('pv: progress bars'
            'lzop: compression'
            'mbuffer: stream buffering')
conflicts=('sanoid-git')
provides=('sanoid')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jimsalterjrs/sanoid/archive/v$pkgver.tar.gz")

sha256sums=('fc73aa133128fd34aed25ff7ca2262476c6485751489603c976cb5e596d110a8')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/sanoid/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/sanoid/LICENSE"
  install -Dm644 sanoid.conf "${pkgdir}/etc/sanoid/sanoid.conf"
  install -Dm644 sanoid.defaults.conf "${pkgdir}/etc/sanoid/sanoid.defaults.conf"
  install -Dm755 sanoid "${pkgdir}/usr/bin/sanoid"
  install -Dm755 syncoid "${pkgdir}/usr/bin/syncoid"
  install -Dm755 findoid "${pkgdir}/usr/bin/findoid"
}
