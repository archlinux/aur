# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: marmis <tiagodepalves@gmail.com>
pkgname=vscode-xdg-patch-hook
pkgdesc="Pacman hooks that patch VSCode files for improved XDG experience (#15741, #129953, #214741)"
# https://github.com/microsoft/vscode/issues/15741
# https://github.com/microsoft/vscode/issues/129953
# https://github.com/microsoft/vscode/issues/214741
url='https://aur.archlinux.org/packages/vscode-xdg-patch-hook'
pkgver=1.0.1
pkgrel=1
arch=('any')
license=(LicenseRef-None)
depends=(sed grep pacman)
optdepends=('code' 'vscode')
options=(!strip !debug)
source=(vscode-xdg-patch.hook apply-xdg-patch.sh)
b2sums=('e4637eb7057ff9cf58daf3468591929938d8b659c980bc0c8f26b97a959735e19221bad6da2312ee1e8770024eb8a27599013ab80fb4a5b32110e10e93a4d80b'
        '406dedaabd8a7fefb2e2966bca93c01ca53e71d7a76a40b323de8fa22994416737f2a4ec3a5f7cb6f2bc08bb0abd29a932c96db419d1aa4816b965989c9fc447')

package() {
  install -d "${pkgdir}/usr/share/libalpm/hooks"
  install -d "${pkgdir}/usr/lib/${pkgname}"

  install -m644 "${srcdir}/vscode-xdg-patch.hook" "${pkgdir}/usr/share/libalpm/hooks/vscode-xdg-patch.hook"
  install -m755 "${srcdir}/apply-xdg-patch.sh" "${pkgdir}/usr/lib/${pkgname}/apply-xdg-patch.sh"
}
