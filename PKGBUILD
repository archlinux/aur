# Maintainer: Alexey D. <lq07829icatm@rambler.ru>

pkgname=tmpfiles-config
pkgver=2012.12.01
pkgrel=1
pkgdesc="Config files for arch-tmpfiles (for systems without Systemd)"
url="https://bitbucket.org/TZ86/initscripts-fork/overview"
arch=('any')
license=('GPL2')
depends=('initscripts-fork')
source=('console.conf'
        'lock.conf'
        'system.conf'
        'tmp.conf'
        'x11.conf')
md5sums=('2ac8d268c295fa3bfa016c258c8bbd22'
         '98cbb8684d804979979a3706d27952d4'
         'f87c2c1284e0a1322c2103d92299b371'
         'd074de44700c5db7e3d48b089ba0eca8'
         'ab432e2a2a1b3f519b56e0fd03201a67')

package() {
  install -dm755 "$pkgdir/usr/lib/tmpfiles.d"

  install -m644 "console.conf" "$pkgdir/usr/lib/tmpfiles.d"
  install -m644 "lock.conf" "$pkgdir/usr/lib/tmpfiles.d"
  install -m644 "system.conf" "$pkgdir/usr/lib/tmpfiles.d"
  install -m644 "tmp.conf" "$pkgdir/usr/lib/tmpfiles.d"
  install -m644 "x11.conf" "$pkgdir/usr/lib/tmpfiles.d"

  # Small workaroud for packages which install scripts uses systemd-tmpfiles
  install -dm755 "$pkgdir/usr/bin"
  ln -s "../lib/initscripts/arch-tmpfiles" "$pkgdir/usr/bin/systemd-tmpfiles"
}

# vim:set ts=2 sw=2 et:
