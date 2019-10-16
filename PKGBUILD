# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-gtk-theme-bin'
pkgver='5.0.0'
pkgrel=7
_timestamp=1571165660
_commit=012d122
pkgdesc='System76 Pop GTK+ Theme'
arch=('any')
url='https://github.com/pop-os/gtk-theme'
license=('GPL2' 'CCPL:by-sa')
conflicts=('pop-gtk-theme')
provides=('pop-gtk-theme')
depends=(
	"gtk3>=3.18.9"
	"gtk2>=2.24.30"
	"gdk-pixbuf2>=2.24.30"
	"gtk-engine-murrine>=0.98.1"
)
optdepends=(
	"gnome-shell"
	"gnome-flashback"
	"budgie-desktop"
	"xfce4-session"
	"mate-desktop"
	"lxde-common"
	"pop-icon-theme: Recommended icon theme"
	"ttf-fira-sans: Recommended font for window titles and interface"
	"ttf-fira-mono: Recommended monospace font"
	"ttf-roboto-slab: Recommended font for documents"
)
source=("http://ppa.launchpad.net/system76/pop/ubuntu/pool/main/p/pop-gtk-theme/pop-gtk-theme_${pkgver}~${_timestamp}~19.10~${_commit}_all.deb")
sha256sums=('d800ee40f983859b75f6b41d622d634c68e35b75635fbaaef5dc86e82131517b')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
  rm -r "${pkgdir}/usr/share/themes/Pop/gnome-shell"
  rm -r "${pkgdir}/usr/share/themes/Pop-dark/gnome-shell"
}

# vim: ts=2 sw=2 et:
