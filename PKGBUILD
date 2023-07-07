# Maintainer: MoetaYuko <loli at yuko.moe>

pkgname=systemd-oomd-defaults
_commit='21df2af848358e77c55269ffbb923fce750c416f'
pkgver=253.5
pkgrel=1
pkgdesc="Configuration files for systemd-oomd"
url="https://src.fedoraproject.org/rpms/systemd"
arch=('any')
license=('LGPL2.1')
depends=('systemd')
makedepends=('git')
source=(git+https://src.fedoraproject.org/rpms/systemd.git#commit=${_commit})
md5sums=('SKIP')

package() {
  cd systemd
  install -Dm0644 -t "$pkgdir"/usr/lib/systemd/oomd.conf.d/ 10-oomd-defaults.conf
  install -Dm0644 -t "$pkgdir"/usr/lib/systemd/system/system.slice.d/ 10-oomd-per-slice-defaults.conf
  install -Dm0644 -t "$pkgdir"/usr/lib/systemd/user/slice.d/ 10-oomd-per-slice-defaults.conf
}
