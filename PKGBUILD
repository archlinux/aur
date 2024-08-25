# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: marmis <tiagodepalves@gmail.com>
pkgname=vscode-xdg-patch-hook
pkgdesc="Patch VSCode files for improved XDG experience (#15741, #129953, #214741)"
url='https://aur.archlinux.org/packages/vscode-xdg-patch-hook'
pkgver=1.0.0
pkgrel=1
arch=('any')
license=(LicenseRef-None)
depends=(sed grep pacman)
optdepends=('code' 'vscode')
options=(!strip !debug)
source=(vscode-xdg-patch.hook apply-xdg-patch.sh)
b2sums=('f237c36fc645a7b84a6006655b3f5657daf37f846e92e492c9d08acb4b3be996ba3583eab0a0d25ac619d0c7a416c505884a37b048941cbca6cc89d41d6c1e83'
        '406dedaabd8a7fefb2e2966bca93c01ca53e71d7a76a40b323de8fa22994416737f2a4ec3a5f7cb6f2bc08bb0abd29a932c96db419d1aa4816b965989c9fc447')

package() {
  install -d "${pkgdir}/usr/share/libalpm/hooks"
  install -d "${pkgdir}/usr/lib/${pkgname}"

  install -m644 "${srcdir}/vscode-xdg-patch.hook" "${pkgdir}/usr/share/libalpm/hooks/vscode-xdg-patch.hook"
  install -m755 "${srcdir}/apply-xdg-patch.sh" "${pkgdir}/usr/lib/${pkgname}/apply-xdg-patch.sh"
}
