# Contributor: cruznick <cruznick@archlinux.us>
# Contributor: fsckd <fsckdaemon -at- gmail>

pkgname=burg-themes
pkgver=20100623
pkgrel=2
pkgdesc="Themes for Burg Bootloader"
arch=('any')
url="https://code.google.com/p/burg/"
license=('GPL')
depends=('burg-bzr')
backup=('boot/burg/gui.cfg' 'boot/burg/burgenv')
install='burg-themes.install'
source=("http://burg.googlecode.com/files/burg-theme-$pkgver.zip")
sha256sums=('795af1678cbcf0c8a57a2f06c7cafeb11da6892f4c2710777a921274f4767b32')

package() {
   local tdir="${pkgdir}/boot/burg"

   for foo in fonts themes
   do
      cd "${srcdir}"
      find "${foo}" -type f -exec install -Dpm644 '{}' "${tdir}/{}" \;
   done

   install -pm644 "${srcdir}"/{burgenv,gui.cfg} "${tdir}"
}
