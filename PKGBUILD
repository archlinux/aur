# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: megadriver <megadriver at gmx dot com>
# Based on clearlooks-phenix-gtk-theme-git, also in the AUR

pkgname=clearlooks-phenix-gtk-theme
pkgver=6.0.3
pkgrel=2
pkgdesc="GTK3 theme visually close to Clearlooks"
arch=('any')
url="https://github.com/jpfleury/clearlooks-phenix"
license=('GPL3')
depends=('gtk-engines')
optdepends=('mist-icon-theme: a visually compatible icon theme')
conflicts=('clearlooks-phenix-gtk-theme-git')
source=("https://github.com/jpfleury/clearlooks-phenix/archive/${pkgver}.tar.gz")
sha256sums=('663a40368107434b1333e42a630de74704f7b71a864e08d6b4ac1a5a68ccd874')

package() {
  cd "clearlooks-phenix-${pkgver}"

  mkdir -p "${pkgdir}/usr/share/themes/Clearlooks-Phenix"
  cp -dR gtk-2.0 gtk-3.0 metacity-1 openbox-3 wallpapers xfwm4 index.theme \
    "${pkgdir}/usr/share/themes/Clearlooks-Phenix"

  mkdir -p "${pkgdir}/usr/share/doc"
  cp -dR doc "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 README.md "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
