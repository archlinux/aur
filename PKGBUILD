# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-gnome-shell-theme-bin'
pkgver='5.0.0'
pkgrel=5
_timestamp=1570998216
_commit=cbbf790
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
sha256sums=('fa896f76803fc98c7f33dc506fe4677e42256139de1dd9b99cc806748143b258')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
  mkdir -p ${pkgdir}/usr/share/themes/Pop/gnome-shell
  mkdir -p ${pkgdir}/usr/share/themes/Pop-dark/gnome-shell
  cp -r ${pkgdir}/usr/share/gnome-shell/theme/Pop/* ${pkgdir}/usr/share/themes/Pop/gnome-shell/
  mv ${pkgdir}/usr/share/gnome-shell/theme/Pop/* ${pkgdir}/usr/share/themes/Pop-dark/gnome-shell/
}

# vim: ts=2 sw=2 et:
