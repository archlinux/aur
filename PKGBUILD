# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Hanabishi
# Contributor: Sergey Vlasov <sergey@vlasov.me>
pkgname=nulloy
pkgver=0.9.8
pkgrel=1
pkgdesc='Music player with a waveform progress bar'
arch=(x86_64)
url='http://nulloy.com/'
license=(GPL-3.0-only)
depends=('gcc-libs'
         'glib2'
         'gst-plugins-base'
         'gst-plugins-base-libs'
         'gst-plugins-good'
         'gstreamer'
         'hicolor-icon-theme'
         'librsvg'
         'libx11'
         'libxcb'
         'qt5-base'
         'qt5-script'
         'qt5-svg'
         'qt5-x11extras'
         'taglib'
         'zlib')
makedepends=('imagemagick'
             'qt5-tools'
             'zip')
optdepends=('gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
source=("https://github.com/$pkgname/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('889a48b9d43b3c2d71078e801d771a3c60977f8e8c00fdef07979413688a0104')

build() {
	cd "$pkgname-$pkgver"
	./configure --gstreamer-tagreader --no-update-check
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="${pkgdir}/" install
}
