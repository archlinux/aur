# Maintainer: procrastinator
pkgname=gyazo
pkgver=1.2.1
pkgrel=1
pkgdesc="Launch the Gyazo app and drag your mouse to grab the screen. "
arch=('any')
url="http://gyazo.com/"
license=('GPL')
groups=(multimedia)
depends=('ruby' 'xclip' 'imagemagick')
conflicts=('gyazo-git')
source=("https://github.com/gyazo/Gyazo-for-Linux/archive/${pkgver}.tar.gz")
sha256sums=('c3a2a336a5f2515fc7cf71b07619ac9dc78e1db78bc326f8979b74d7ed4132e6')

package() {
	cd "${srcdir}"

  install -D -m755 "${srcdir}/Gyazo-for-Linux-${pkgver}/src/gyazo.rb" \
					"${pkgdir}/usr/bin/gyazo"

  install -D -m664 "${srcdir}/Gyazo-for-Linux-${pkgver}/src/gyazo.desktop" \
					"${pkgdir}/usr/share/applications/gyazo.desktop"

  install -D -m664 "${srcdir}/Gyazo-for-Linux-${pkgver}/icons/gyazo.png" \
					"${pkgdir}/usr/share/pixmaps/gyazo.png"
}
