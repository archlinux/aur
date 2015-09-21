# Maintainer: procrastinator
pkgname=gyazo
pkgver=1.1
pkgrel=1
pkgdesc="Launch the Gyazo app and drag your mouse to grab the screen. "
arch=('any')
url="http://gyazo.com/"
license=('GPL')
groups=(multimedia)
depends=('ruby' 'xclip' 'imagemagick')
conflicts=('gyazo-git')
source=("https://github.com/gyazo/Gyazo-for-Linux/archive/${pkgver}.tar.gz")
sha256sums=('31a9a612fe8a656fff73c3382a582cf38448251cd9b15ef5de94a00cc77aa114')

package() {
	cd "${srcdir}"

  install -D -m755 "${srcdir}/Gyazo-for-Linux-${pkgver}/src/gyazo.rb" \
					"${pkgdir}/usr/bin/gyazo"

  install -D -m664 "${srcdir}/Gyazo-for-Linux-${pkgver}/src/gyazo.desktop" \
					"${pkgdir}/usr/share/applications/gyazo.desktop"

  install -D -m664 "${srcdir}/Gyazo-for-Linux-${pkgver}/icons/gyazo.png" \
					"${pkgdir}/usr/share/pixmaps/gyazo.png"
}
