# Maintainer: Lucas Saliés Brum <lucas@archlinux.com.br>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mate-screensaver-hacks
pkgver=5.43
pkgrel=1
pkgdesc="Enable screensavers from xscreensaver for MATE."
arch=('any')
url="http://www.jwz.org/xscreensaver/"
license=('BSD')
depends=('xscreensaver')
makedepends=('libxslt')
source=(migrate-xscreensaver-config.sh
        xscreensaver-config.xsl
        LICENSE)
sha1sums=('19195ef59f0dbc61c6ed599a968213a8f0a7a5d4'
          '68e8ec7a4f7077f7f870b904f370329f5e95bce0'
          '4209ea586b204fd1d81c382a0522c654f9fd9134')


package() {
    mkdir -p "${pkgdir}/usr/share/applications/screensavers/"
    cd "${pkgdir}/usr/share/applications/screensavers/"
    sh "$srcdir/migrate-xscreensaver-config.sh" /usr/share/xscreensaver/config/*.xml
    rm ${pkgdir}/usr/share/applications/screensavers/popsquares.desktop
    install -D -m644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
