# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-gnome-shell-theme-bin'
pkgver='5.0.0'
pkgrel=7
_timestamp=1571237549
_commit=618aedf
pkgdesc='System76 Pop GNOME Shell Theme'
arch=('any')
url='https://github.com/pop-os/gnome-shell-theme'
license=('GPL2' 'CCPL:by-sa')
conflicts=('pop-gnome-shell-theme')
provides=('pop-gnome-shell-theme')
depends=(
  "gnome-shell>=3.18.3"
  "pop-gtk-theme-bin"
)
optdepends=(
  "pop-icon-theme-bin: Recommended icon theme"
  "ttf-fira-sans: Recommended font for window titles and interface"
  "ttf-fira-mono: Recommended monospace font"
  "ttf-roboto-slab: Recommended font for documents"
)
source=("http://ppa.launchpad.net/system76/pop/ubuntu/pool/main/p/pop-gtk-theme/pop-gnome-shell-theme_${pkgver}~${_timestamp}~19.10~${_commit}_all.deb")
sha256sums=('3011ccda6018502d34b23dc1ad04b14d750d76df739ce4a7a2ce8e770cf19866')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
  mkdir -p ${pkgdir}/usr/share/themes/Pop/gnome-shell
  mkdir -p ${pkgdir}/usr/share/themes/Pop-dark/gnome-shell
  cp -r ${pkgdir}/usr/share/gnome-shell/theme/Pop/* ${pkgdir}/usr/share/themes/Pop/gnome-shell/
  mv ${pkgdir}/usr/share/gnome-shell/theme/Pop/* ${pkgdir}/usr/share/themes/Pop-dark/gnome-shell/
}

# vim: ts=2 sw=2 et:
