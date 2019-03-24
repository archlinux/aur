# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=wl-clipboard-x11
pkgver=3
pkgrel=1
pkgdesc='A wrapper to use wl-clipboard as a drop-in replacement to X11 clipboard tools'
url='https://github.com/brunelli/wl-clipboard-x11'
license=('GPL')
arch=('any')
depends=('wl-clipboard')
makedepends=('make' 'sed')
provides=('xclip' 'xsel')
conflicts=('xclip' 'xsel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brunelli/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('7f87163779465c951c818ac012f0e7ab11b5a0534cd396987d3ff526c3cd1f9d')

package() {
    cd "${pkgname}-${pkgver}"
    sed -i '/^[[:space:]]\+@ln -.*$/s/\$(DESTDIR)//' Makefile
    make install DESTDIR="$pkgdir"
}
