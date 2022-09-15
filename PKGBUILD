# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-tab-unloader-for-tree-style-tab
pkgver=6.15
_commit=3d0ed09fc66f397494bad7619618dcf61cc05ce3
pkgrel=1
pkgdesc='Tab unload options for Tree Style Tab'
arch=('any')
url=https://github.com/Lej77/tab-unloader-for-tree-style-tab
license=('GPL3')
groups=('firefox-addons')
makedepends=('git' 'strip-nondeterminism' 'zip')
source=("git+$url.git#commit=$_commit")
b2sums=('SKIP')

package() {
  cd ${pkgname#firefox-}
  install -d "$pkgdir"/usr/lib/firefox/browser/extensions
  zip -r \
    "$pkgdir"/usr/lib/firefox/browser/extensions/{7aa0a466-58f8-427b-8cd2-e94645c4edc2}.xpi \
    ./* -x '.git*' README.md
  strip-nondeterminism -t zip "$pkgdir"/usr/lib/firefox/browser/extensions/*.xpi
}
