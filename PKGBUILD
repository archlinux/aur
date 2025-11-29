# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: marmis <tiagodepalves@gmail.com>
pkgname=vscode-xdg-patch-hook
pkgdesc='Pacman hooks that patch VSCode files for improved XDG experience (#15741, #214741)'
# https://github.com/microsoft/vscode/issues/15741
# https://github.com/microsoft/vscode/issues/214741
url='https://aur.archlinux.org/packages/vscode-xdg-patch-hook'
pkgver=1.0.4
pkgrel=1
arch=('any')
license=('LicenseRef-None')
install=${pkgname}.install
depends=('sed' 'grep' 'pacman')
optdepends=('code' 'vscode')
options=(!strip !debug)
source=('vscode-xdg-patch.hook' 'apply-xdg-patch.sh')
b2sums=('0b88468f8a9fbf730f5b853c78651610c7c88875be2755b46b83012a497d5d48029ca746bcffbe460006401e9bb24c16ebd72c3776f2b5c9777dab7c6df10505'
        '7b76279f6f35e69be0977e9fe803764b86e8a733bbe489c19a5e9d005dbfe6c25bd8a7d42126dcac3a61826ac9b91035bf9d41e5323e2e789ed7654b4ba61ab9')

package() {
  install -d "${pkgdir}/usr/share/libalpm/hooks"
  install -d "${pkgdir}/usr/lib/${pkgname}"

  install -m644 "${srcdir}/vscode-xdg-patch.hook" "${pkgdir}/usr/share/libalpm/hooks/vscode-xdg-patch.hook"
  install -m755 "${srcdir}/apply-xdg-patch.sh" "${pkgdir}/usr/lib/${pkgname}/apply-xdg-patch.sh"
}
