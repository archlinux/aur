# Maintainer: Matthew "Madness" Evan <mattmadness@420blaze.it>

pkgname=wallset
pkgver=v0.1alpha
pkgrel=1
pkgdesc="A wallpaper manager that makes it easy to set videos as your wallpaper"
arch=('any')
url="https://github.com/terroo/wallset"
license=('GPL3')
depends=('ffmpeg' 'feh' 'imagemagick' 'xorg-xrandr' 'xdg-utils' 'bash' 'sed')
source=("https://github.com/terroo/wallset/archive/refs/tags/v0.1-alpha.tar.gz")
sha256sums=('00247de94d8a9d5794692c721fb635628db308ad3b6e401c1045d43a917c3b03')

package() {
  cd ${srcdir}/wallset-0.1-alpha

  # Install examples
  mkdir --parents ${pkgdir}/usr/share/wallset
  cp -r examples ${pkgdir}/usr/share/wallset/

  # Install README
  mkdir --parents ${pkgdir}/usr/share/doc/wallset
  cp README.md ${pkgdir}/usr/share/doc/wallset/
 
  # Install license 
  mkdir --parents ${pkgdir}/usr/share/licenses/wallset
  cp LICENSE ${pkgdir}/usr/share/licenses/wallset/
 
  # Install wallset
  mkdir --parents ${pkgdir}/usr/bin
  cp wallset ${pkgdir}/usr/bin/
  chmod +x ${pkgdir}/usr/bin/wallset 
}
