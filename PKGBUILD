# Maintainer: ikubaku <hide4d51 at gmail.com>
# Contributor (Maintainer until 1.2.1): procrastinator
pkgname=gyazo
pkgver=1.3.2
pkgrel=1
pkgdesc="Launch the Gyazo app and drag your mouse to grab the screen. "
arch=('any')
url="http://gyazo.com/"
license=('GPL')
groups=(multimedia)
depends=('ruby' 'xclip' 'imagemagick' 'xdotool' 'xorg-xprop' 'xorg-xwininfo')
conflicts=('gyazo-git')
source=("https://github.com/gyazo/Gyazo-for-Linux/archive/${pkgver}.tar.gz")
sha256sums=('a474949a44bc0c7c8f9bf922c3ac630543982e8d0b934a5121a95d44f22e11b9')

package() {
	cd "${srcdir}"

  install -D -m755 "${srcdir}/Gyazo-for-Linux-${pkgver}/src/gyazo.rb" \
					"${pkgdir}/usr/bin/gyazo"

  install -D -m664 "${srcdir}/Gyazo-for-Linux-${pkgver}/src/gyazo.desktop" \
					"${pkgdir}/usr/share/applications/gyazo.desktop"

  install -D -m664 "${srcdir}/Gyazo-for-Linux-${pkgver}/icons/gyazo.png" \
					"${pkgdir}/usr/share/pixmaps/gyazo.png"
}
