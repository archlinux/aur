# Maintainer:Blazock<Blazock@outlook.com>
pkgbase="ttf-lxgw-bright-code-git"
pkgname=("ttf-lxgw-bright-code-git" "ttf-lxgw-bright-code-gb-git" "ttf-lxgw-bright-code-tc-git")
pkgver=2.602.r0.gbe0b148
pkgrel=1
pkgdesc="LXGW Bright Code 是由 Monaspace Argon 与 霞鹜文楷系列字体 合并而成的字体"
arch=("any")
_gitname="LxgwBright-Code"
url="https://github.com/lxgw/${_gitname}"
license=("OFL")
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package_ttf-lxgw-bright-code-git() {
  provides=("ttf-lxgw-bright-code=${pkgver}")
  conflicts=("ttf-lxgw-bright-code")
  cd "${_gitname}"
  install -Dm644 LxgwBrightCode/*.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_ttf-lxgw-bright-code-gb-git() {
  provides=("ttf-lxgw-bright-code-gb=${pkgver}")
  conflicts=("ttf-lxgw-bright-code-gb")
  cd "${_gitname}"
  install -Dm644 LxgwBrightCodeGB/*.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_ttf-lxgw-bright-code-tc-git() {
  provides=("ttf-lxgw-bright-code-tc=${pkgver}")
  conflicts=("ttf-lxgw-bright-code-tc")
  cd "${_gitname}"
  install -Dm644 LxgwBrightCodeTC/*.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
