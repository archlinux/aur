# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Florian Léger

pkgname=archlinux-menus
pkgver=2.5
pkgrel=5
pkgdesc="Arch Linux specific XDG-compliant menu"
arch=('any')
url="https://www.archlinux.org/"
license=('GPL')
depends=('xdg-utils')
source=(Arch-AUR.desktop
        Arch-Bugs.desktop
        Arch-Developers.desktop
        Arch-Documentation.desktop
        Arch-Donate.desktop
        Arch-Forum.desktop
        Arch-Homepage.desktop
        Arch-Schwag.desktop
        Arch-SVN.desktop
        Arch-Wiki.desktop
        arch-logo.png
        arch-logo.svg
        Archlinux.directory
        Archlinux.menu)
md5sums=('22c4a3533313dc0109745e7dd9429063'
         '8fe13e6e248352a2baad4842a45b192f'
         'e1449a1ed49d77b09446df2ba5bd506f'
         '8f94bc16f907e6b6f228a2105d568ef2'
         'c7a15378b6ba26e3a00fcae03a0c921c'
         'f1ecba79979012b0d0ed8c1dc126640a'
         '0d1e904603fefdcd33071eb8a8aac363'
         '590a2c193c8a9fd14e731cd806cc6f68'
         '3b1d86562de7ccada5238fec89359f15'
         'd63e9888bda895438398f030071a1832'
         '7ca3b587c44b8fdbff2074b753fb76f7'
         'bba394457ae6c65038413be53b65dd20'
         'e612c000a1d5342aaa3a66d23e5c7c03'
         'ed9da5892f09119bfed932a760c0366d')

package() {
  cd "${srcdir}"
  install -m755 -d "${pkgdir}/usr/share/desktop-directories"
  install -m755 -d "${pkgdir}/usr/share/applications"
  install -m755 -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -m755 -d "${pkgdir}/usr/share/icons/hicolor/32x32/apps"
  install -m755 -d "${pkgdir}/etc/xdg/menus/applications-merged"

  install -m644 *.desktop "${pkgdir}/usr/share/applications/"
  install -m644 arch-logo.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/"
  install -m644 arch-logo.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
  install -m644 Archlinux.directory "${pkgdir}/usr/share/desktop-directories/"
  install -m644 Archlinux.menu "${pkgdir}/etc/xdg/menus/applications-merged/"
}
