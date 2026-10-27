# Maintainer: Eugene Flanagin <eflanagin@pm.me>
#
# Transitional package: Linux System Audit (LSA) is now part of SRS (srs-sysinfo 2.2.0 and later),
# whose Benchmarks & stress page has the Cache & Memory benchmark with LSA's engine. Updating
# lsa-sysinfo to this version removes the old LSA program and its menu entries, installs SRS, and
# keeps the lsa / lsa-gui commands working as small wrappers.
# LSA's sources and releases (including the Windows build) stay on GitHub.

pkgname=lsa-sysinfo
pkgver=1.0.0
pkgrel=1
pkgdesc="Linux System Audit is now part of SRS (srs-sysinfo): transitional package with the lsa and lsa-gui commands"
arch=('any')
url="https://github.com/eugenesflanagin-spec/lsa-sysinfo"
license=('GPL-2.0-or-later')
depends=('srs-sysinfo>=2.2.0')
source=('lsa' 'lsa-gui')
sha256sums=('99f81f32098d12e541d1886abac40d1d2df3e039fab95f739ded21d46c9b2bd5'
            'afb80c96bab029a7e8cc7916a49244c575113116a6bac714bcd5d3b2102d066b')

package() {
  install -Dm755 "$srcdir/lsa" "$pkgdir/usr/bin/lsa"
  install -Dm755 "$srcdir/lsa-gui" "$pkgdir/usr/bin/lsa-gui"
}
