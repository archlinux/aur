# Maintainer: anex <lane.wiscombe_at_gmail_dot_org>
# Maintainer: Philip Müller <philm_at_manjaro_dot_org>
# Maintainer: Rob McCathie <rob_at_manjaro_dot_org>

pkgbase=menda-themes-git
pkgname=("menda-themes-git" "menda-themes-dark-git")
pkgver=r85.0ee4e31
pkgrel=1
arch=('any')
url="https://github.com/manjaro/artwork-menda"
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines')
optdepends=("menda-circle-icon-theme-git: Recommended icon theme")
source=(${pkgname}::'git+https://github.com/manjaro/artwork-menda.git')
sha1sums=('SKIP')


pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_menda-themes-git() {
  pkgdesc="Manjaro's official Gtk2, Gtk3, Metacity, Xfwm, Openbox, Cinnamon and GNOME Shell themes"
  replaces=('menda-themes')
  conflicts=('menda-themes')
  provide=('menda-themes')

  install -dm755 "${pkgdir}/usr/share/themes"
  install -Dm755 "${srcdir}/${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -r "${srcdir}/${pkgbase}/Menda" "${pkgdir}/usr/share/themes"
}

package_menda-themes-dark-git() {
  pkgdesc="Manjaro's official Gtk2, Gtk3, Metacity, Xfwm, Openbox, Cinnamon and GNOME Shell themes. Dark version."
  replaces=('menda-themes-dark')
  conflicts=('menda-themes-dark')
  provide=('menda-themes-dark')

  install -dm755 "${pkgdir}/usr/share/themes"
  install -Dm755 "${srcdir}/${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -r "${srcdir}/${pkgbase}/Menda-Dark" "${pkgdir}/usr/share/themes"
}
