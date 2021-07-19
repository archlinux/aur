# Maintainer: dianlujitao <dianlujitao at gmail.com>

pkgname=systemd-oomd-defaults
_commit='6dd3849ca6931b560607ffb54fe23f126fb3ad32'
_commit_name=249
pkgver="${_commit_name/-/}"
pkgrel=1
pkgdesc="Configuration files for systemd-oomd"
url="https://src.fedoraproject.org/rpms/systemd"
arch=('any')
license=('LGPL2.1')
depends=('systemd')
source=(git+https://src.fedoraproject.org/rpms/systemd.git#commit=${_commit})
md5sums=('SKIP')

package() {
  cd systemd
  install -Dm0644 -t "$pkgdir"/usr/lib/systemd/oomd.conf.d/ 10-oomd-defaults.conf
  install -Dm0644 -t "$pkgdir"/usr/lib/systemd/system/-.slice.d/ 10-oomd-root-slice-defaults.conf
  install -Dm0644 -t "$pkgdir"/usr/lib/systemd/system/user@.service.d/ 10-oomd-user-service-defaults.conf
}
