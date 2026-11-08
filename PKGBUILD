# Maintainer: Swastik Patel <CPT-Dawn at users dot noreply dot github dot com>
#
# Source of truth: packaging/aur/ in https://github.com/CPT-Dawn/Hoarder.
# The release workflow fills in pkgver (packaging/aur/render.sh).

pkgname=hoarder-wl-compat
pkgver=1.0.0
pkgrel=1
pkgdesc='wl-copy and wl-paste served by Hoarder, in place of wl-clipboard'
arch=('any')
url='https://github.com/CPT-Dawn/Hoarder'
license=('MIT')
# hoarder, hoarder-bin and hoarder-git all provide it. The shims dispatch on
# argv[0] and accept every wl-copy and wl-paste flag (PLAN.md section 5.2).
depends=('hoarder')
provides=('wl-clipboard')
conflicts=('wl-clipboard')
source=('LICENSE')
sha256sums=('eaf1abbe531120536be536981f87c1ae1e035f3f80795b52f3e899f332189d34')

package() {
  install -d "$pkgdir/usr/bin"
  ln -s hoarder "$pkgdir/usr/bin/wl-copy"
  ln -s hoarder "$pkgdir/usr/bin/wl-paste"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
