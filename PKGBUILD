# Maintainer: MoetaYuko <loli at yuko.moe>

pkgname=systemd-oomd-defaults
_commit='21df2af848358e77c55269ffbb923fce750c416f'
pkgver=253.5
pkgrel=2
pkgdesc="Configuration files for systemd-oomd"
url="https://src.fedoraproject.org/rpms/systemd"
arch=('any')
license=('LGPL2.1')
depends=('systemd')
source=("https://src.fedoraproject.org/rpms/systemd/raw/${_commit}/f/10-oomd-defaults.conf"
        "https://src.fedoraproject.org/rpms/systemd/raw/${_commit}/f/10-oomd-per-slice-defaults.conf")
sha256sums=('f7c8e9d3455bf54795063e3914956b4e15ba52f493b0f2304abef6326a80c6cb'
            '3f0d6882312affecddfdc5a204a44c34b90c573839f2a4850a26b44f528520bd')

package() {
  install -Dm0644 -t "$pkgdir"/usr/lib/systemd/oomd.conf.d/ 10-oomd-defaults.conf
  install -Dm0644 -t "$pkgdir"/usr/lib/systemd/system/system.slice.d/ 10-oomd-per-slice-defaults.conf
  install -Dm0644 -t "$pkgdir"/usr/lib/systemd/user/slice.d/ 10-oomd-per-slice-defaults.conf
}
