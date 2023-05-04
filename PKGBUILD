# Maintainer: JisuWoniu <jswn@jswn9945.xyz>

pkgbase="ttf-lxgw-bright-git"
pkgname=("ttf-lxgw-bright-git" "ttf-lxgw-bright-gb-git" "ttf-lxgw-bright-tc-git")
pkgver=5.300.r0.g7d64795
pkgrel=1
pkgdesc="A merged font of Ysabeau and LXGW WenKai."
arch=("any")
_gitname="LxgwBright"
url="https://github.com/lxgw/${_gitname}"
license=("OFL")
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package_ttf-lxgw-bright-git() {
  provides=("ttf-lxgw-bright=${pkgver}")
  conflicts=("ttf-lxgw-bright")
  cd "${_gitname}"
  install -Dm644 LXGWBright/*.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_ttf-lxgw-bright-gb-git() {
  provides=("ttf-lxgw-bright-gb=${pkgver}")
  conflicts=("ttf-lxgw-bright-gb")
  cd "${_gitname}"
  install -Dm644 LXGWBrightGB/*.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_ttf-lxgw-bright-tc-git() {
  provides=("ttf-lxgw-bright-tc=${pkgver}")
  conflicts=("ttf-lxgw-bright-tc")
  cd "${_gitname}"
  install -Dm644 LXGWBrightTC/*.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
