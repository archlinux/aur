# Contributor: Baptiste Grenier <baptiste@bapt.name>
# Contributor: Pablo Olmos de Aguilera Corradini <pablo <at] glatelier (dot} org>
# Maintainer: Sander van Kasteel <info at sandervankasteel dot nl>
pkgname=gtg-git
pkgver=r5675.abe2a911
pkgrel=1
pkgdesc="Personal GTD like organizer for the GNOME desktop environment. Git version."
url="https://wiki.gnome.org/Apps/GTG"
arch=('x86_64')
license=('GPL')
depends=('pygtk' 'python-gobject' 'python-configobj' 'dbus-python'
'hicolor-icon-theme' 'desktop-file-utils' 'python2-gnomekeyring'
'python-liblarch-git' 'python-dbus' 'python-cairo' 'python-pyxdg')
makedepends=('git' 'python-gobject')
optdepends=(
'python2-bugzilla: for Bugzilla plugin (python-bugz)'
'python-cheetah: for Export and print plugin'
'texlive-bin: for Export and print plugin (for pdflatex)'
'pdftk: for Export and print plugin'
'pdfjam: for Export and print plugin'
'python-geoclue: for Geolocalized tasks plugin'
'python-clutter: for Geolocalized tasks plugin'
'python-clutter-gtk: for Geolocalized tasks plugin'
'python-champlain: for Geolocalized tasks plugin'
'python-champlain-gtk: for Geolocalized tasks plugin'
'hamster-time-tracker: for Hamster Time Tracker Integration to integrate with'
'python2-libappindicator: for Notification area plugin (python-appindicator)'
'python-dbus: for Tomboy/Gnote plugin'
'python-evolution: for Evolution synchronization service'
'python-dateutil: for Evolution and RememberTheMilk synchronization services'
'python-suds: for MantisBT synchronization service'
'python-launchpadlib: for Launchpad synchronization service'
)
install="${pkgname}.install"
source=("${pkgname}::git+https://github.com/getting-things-gnome/gtg")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  meson -Dprofile=development -Dprefix=${pkgdir}/usr .aur_build

  ninja -C .aur_build install

  install -d "${pkgdir}"/usr
}

md5sums=('SKIP')
