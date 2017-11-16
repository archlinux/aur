# $Id$
# Maintainer: VerruckteFuchs <derverrucktefuchs@gmail.com>

pkgname=noto-fonts-emoji-lollipop
_pkgver=2017-05-19
_commit=09e5d14766875b7ce15f832c966d22dd02cad848
pkgver=2015.09.29.license.apache
pkgrel=1
pkgdesc="Google Noto emoji fonts (Android Lollipop blob version with B&W emoji)"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:OFL)
depends=(fontconfig)
provides=(noto-fonts-emoji)
conflicts=(noto-fonts-emoji)
#source=(git+https://github.com/DerVerruckteFuchs/noto-blob-emoji)
source=(git+https://github.com/googlei18n/noto-emoji)
#sha256sums=('d1d6af8c6606a0b790254b9dd52ae9a2cba85ef7003d7e03430b1634ac7a4877')
sha256sums=(SKIP)

pkgver() {
	cd "$srcdir"/noto-emoji
	git checkout v2015-09-29-license-apache
	git describe --tags | sed -e 's:v::' -e 's/-/./g'
}

package() {
    cd "$pkgdir"
    mkdir -p "$pkgdir"/usr/share/fonts/noto
    install -m644 "$srcdir"/noto-emoji/*.ttf "$pkgdir"/usr/share/fonts/noto
    install -Dm644 "$srcdir"/noto-emoji/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
