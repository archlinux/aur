#Mantainer: 3ED_0 <krzysztof1987 at gmail>

pkgname=gtk-theme-zukitwo-bzr
_pkgname=zukitwo
pkgver=v3.14.r71
_gnomever=3.14
pkgrel=1
pkgdesc="A theme for GTK3, GTK2, Metacity, xfwm4, Gnome Shell and Unity."
arch=('any')
url="http://gnome-look.org/content/show.php/Zukitwo?content=140562"
license=('GPL3')
makedepends=('bzr')
depends=('gtk-engine-murrine' 'gtk-engines')
optdepends=('gnome-themes-standard: Required for the GTK3 theme'
            'ttf-droid: Font family for the Gnome Shell theme')
conflicts=('zukitwo-themes')
provides=('zukitwo-themes')
source=("${_pkgname}-${_gnomever}::bzr+http://bazaar.launchpad.net/~lassekongo83/${_pkgname}/${_gnomever}/")
sha1sums=('SKIP')

pkgver() {
  cd "${_pkgname}-${_gnomever}"
  printf "v%s.r%s" "${_gnomever}" "$(bzr revno)"
}

package() {
  cd "${_pkgname}-${_gnomever}"
  install -dm755 "$pkgdir/usr/share/themes/"
  bsdtar -cf - Zukitwo*/ | bsdtar -xf - -C "$pkgdir/usr/share/themes/"
  chmod -R a=r,a+X,u+w "$pkgdir/usr/share/themes/"
}

# vim:set ts=2 sw=2 et:
