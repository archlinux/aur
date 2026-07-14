# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=vscode-xdg-patch-hook
pkgdesc='Pacman hooks that patch VSCode files for improved XDG experience (#15741, #214741)'
pkgver=1.0.5
pkgrel=1
# https://github.com/microsoft/vscode/issues/15741
# https://github.com/microsoft/vscode/issues/214741
url='https://aur.archlinux.org/packages/vscode-xdg-patch-hook'
arch=(any)
license=('0BSD')
install=${pkgname}.install
depends=('sed' 'grep' 'pacman')
optdepends=('code' 'vscode')
options=(!strip !debug)
source=('vscode-xdg-patch.hook'
        'apply-xdg-patch.sh'
        'LICENSE')
b2sums=('0b88468f8a9fbf730f5b853c78651610c7c88875be2755b46b83012a497d5d48029ca746bcffbe460006401e9bb24c16ebd72c3776f2b5c9777dab7c6df10505'
        '01a900422907294d7fdfb123439bed74418cd6138bb464de3e43236839b1a35b6e1da4b31e8cd44cc6cd82e24bed1be6a1aa0f250dcc4b00d2969843a15e408b'
        'a29664104e1ee73ca0aee1d633e9095d92a57c92787f8d8740bdb7211ba3205782ed8677f539bdb8cae3dd75a3694be3132e185fa3fc4b3f401e1f88eb776101')

package() {
  install -vD -t "${pkgdir}/usr/lib/${pkgname}/" -m755 apply-xdg-patch.sh
  install -vD -t "${pkgdir}/usr/share/libalpm/hooks/" -m644 vscode-xdg-patch.hook
  install -vD -t "${pkgdir}/usr/share/licenses/${pkgname}/" -m644 LICENSE
}
