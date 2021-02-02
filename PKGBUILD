# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: dr460nf1r3 <dr460nf1r3@garudalinux.org>

pkgname=librewolf-ublock-origin
pkgver=1.33.2
_commit=e13bf4d6d626eae726e09067b2e143bb6271c81f
pkgrel=1
pkgdesc='Efficient blocker add-on for various browsers. Fast, potent, and lean'
arch=('any')
url=https://github.com/gorhill/uBlock
license=('GPL3')
groups=('librewolf-addons')
makedepends=('git' 'python' 'zip')
source=("git+$url.git#commit=$_commit?signed"
        "git+https://github.com/uBlockOrigin/uAssets.git")
b2sums=('SKIP' 'SKIP')
validpgpkeys=('603B28AA5D6CD687A554347425E1490B761470C2') # Raymond Hill <rhill@raymondhill.net>

build() {
  cd uBlock
  ./tools/make-firefox.sh all
}

package() {
  cd uBlock/dist/build
  install -Dm644 uBlock0.firefox.xpi \
    "$pkgdir"/usr/lib/librewolf/browser/extensions/uBlock0@raymondhill.net.xpi
}
