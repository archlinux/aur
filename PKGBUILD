# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=wl-clipboard-x11
pkgver=2
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
sha256sums=('800fb40fa3a47d079610c7ac43eae27f105871b8a926f31b65775d2d0708a379')

package() {
    cd "${pkgname}-${pkgver}"
    sed -i '/^[[:space:]]\+@ln -.*$/s/\$(DESTDIR)//' Makefile
    make install DESTDIR="$pkgdir"
}
