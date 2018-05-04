# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=cros-adapta-gtk-theme-git
pkgver=latest
pkgrel=1
pkgdesc='Adapta crostini theme, the Chrome OS GTK+ theme'
arch=('any')
url='https://github.com/adapta-project/adapta-gtk-theme'
license=('GPL2')
depends=('gtk-engine-murrine' 'gtk3')
makedepends=('git' 'gnome-shell' 'inkscape' 'libxml2' 'parallel' 'sassc')
optdepends=('gnome-shell: The GNOME Shell'
            'gnome-flashback: The GNOME flashback shell'
            'budgie-desktop: The Budgie desktop'
            'cinnamon: The Cinnamon desktop'
            'xfdesktop: The Xfce desktop')
provides=('adapta-gtk-theme')
conflicts=('adapta-gtk-theme'
           'adapta-gtk-theme-git')
source=('git+https://chromium.googlesource.com/chromiumos/third_party/cros-adapta')
sha256sums=('SKIP')

pkgver() {
  cd cros-adapta

  git describe --tags --always | sed 's/-/.r/; s/-g/./'
}

package() {
  cd cros-adapta

  install -dm 755 "${pkgdir}"/usr/share/themes/cros-adapta
  
  cp -r assets "${pkgdir}"/usr/share/themes/cros-adapta/
  cp -r gtk-2.0 "${pkgdir}"/usr/share/themes/cros-adapta/
  cp -r gtk-3.0 "${pkgdir}"/usr/share/themes/cros-adapta/
  cp -r gtk-3.22 "${pkgdir}"/usr/share/themes/cros-adapta/
  cp index.theme "${pkgdir}"/usr/share/themes/cros-adapta/
}
