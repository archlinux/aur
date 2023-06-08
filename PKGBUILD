# Maintainer: Amanoel Dawod <amoka at amanoel dot com>
# Contributor: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>

pkgbase=intel-one-mono-fonts
pkgname=({otf,ttf,woff,woff2}-intel-one-mono)
pkgver=1.2.1
pkgrel=2
pkgdesc="Expressive monospaced font family that’s built with clarity, legibility, and the needs of developers in mind"
url="https://github.com/intel/intel-one-mono"
arch=(any)
license=(custom:OFL)
makedepends=(git)
_commit=b6d5c2f0044ba2a1357fa655ce95a8eceb7b5add  # tags/V1.2.1^0
source=("git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd intel-one-mono
  git describe --tags | sed -r 's/^V//;s/[^-]*-g/r&/;s/-/+/g'
}

package_otf-intel-one-mono() {
  cd intel-one-mono/fonts
  install -Dt "$pkgdir"/usr/share/fonts/OTF -m644 otf/*.otf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 otf/license
}

package_ttf-intel-one-mono() {
  cd intel-one-mono/fonts
  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 ttf/*.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 ttf/license
}

package_woff-intel-one-mono() {
  cd intel-one-mono/fonts
  install -Dt "$pkgdir"/usr/share/fonts/WOFF -m644 woff/*.woff
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 woff/license
}

package_woff2-intel-one-mono() {
  cd intel-one-mono/fonts
  install -Dt "$pkgdir"/usr/share/fonts/WOFF2 -m644 woff2/*.woff2
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 woff2/license
}
