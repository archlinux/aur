# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-tab-unloader-for-tree-style-tab
_commit=cfab4ef34175f4e36eb781785d0f38f34c634f1f
pkgver=6.17
pkgrel=2
pkgdesc='Tab unload options for Tree Style Tab'
arch=(any)
url=https://github.com/Lej77/tab-unloader-for-tree-style-tab
license=(GPL-3.0-only)
groups=(firefox-addons)
makedepends=(
  git
  strip-nondeterminism
  zip
)
source=("git+$url.git#commit=$_commit")
b2sums=('eed9a1bd908af06bdf1d8ce9b1cd3661a987db3ef39393ab9712ee183c27e2dfc34a128d07452d2c0cc226e47b4e7b1c592ff37925481cc8e035d2060228ece2')

package() {
  cd ${pkgname#firefox-}/src
  install -d "$pkgdir"/usr/lib/firefox/browser/extensions
  zip -r \
    "$pkgdir"/usr/lib/firefox/browser/extensions/\{7aa0a466-58f8-427b-8cd2-e94645c4edc2\}.xpi \
    -- *
  strip-nondeterminism -t zip "$pkgdir"/usr/lib/firefox/browser/extensions/*.xpi
}
