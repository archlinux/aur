# Maintainer: witt <1989161762 at qq dot com>

pkgname=dbeaver-jvm-hook
pkgver=0.0.1
pkgrel=1
pkgdesc="A hook for dbeaver to support native jvm"
arch=('any')
url="https://aur.archlinux.org/packages/dbeaver-jvm-hook"
license=('Apache-2.0')
provides=("dbeaver-jvm-hook" "dbeaver-vm-hook")
conflicts=("dbeaver-jvm-hook-bin" "dbeaver-vm-hook")
depends=(sed grep pacman)
optdepends=('dbeaver' 'dbeaver-ce' 'dbeaver-git')
options=(!strip !debug)
install="dbeaver-jvm-hook.install"
source=(
  "dbeaver-jvm-setting.hook" "dbeaver-jvm-setting.sh"
)
sha256sums=('ec6e7794395f35613c3be6d28d8a9c7125277729e29e37f0e42b18e0b3b539c6'
            'e42a84ee33568e84d93d3a5aa26c1a6443ea6de5d274d00d46930709b3ab3215')


package() {
  install -d "${pkgdir}/usr/share/libalpm/hooks"
  install -d "${pkgdir}/usr/share/libalpm/scripts"

  install -m644 "${srcdir}/dbeaver-jvm-setting.hook" "${pkgdir}/usr/share/libalpm/hooks/"
  install -m755 "${srcdir}/dbeaver-jvm-setting.sh" "${pkgdir}/usr/share/libalpm/scripts/"
}
# vim: set sw=2 ts=2 et:
