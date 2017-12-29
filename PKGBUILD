# Maintainer: Ben Blain <ben [AT] servc [DOT] eu>
pkgname=dvorak-ukp
pkgver=0.1
pkgrel=1
pkgdesc="dvorak-ukp, dvorak with UK punctuation"
arch=('any')
url="https://servc.eu/content/dvorak-uk-punctuation"
license=('GPL')
groups=('keyboardlayouts')

source=('https://servc.eu/p/sslf/keymaps/dvorak-ukp.map.gz')
noextract=('dvorak-ukp.map.gz')

md5sums=('810ef70b0bdc769e17f33166536d5737')
sha256sums=('04ce3ca883f287a38229376e0a4eb0036fce54d81de25d722ea20b232a1bd074')

build() {
    mkdir -p "$pkgname-$pkgver"
    cd "$pkgname-$pkgver"

    mkdir -p usr/share/kbd/keymaps/i386/dvorak

    cp $srcdir/../dvorak-ukp.map.gz usr/share/kbd/keymaps/i386/dvorak/dvorak-ukp.map.gz
}

package() {
    cd "$pkgname-$pkgver"

    cp -vr ./usr/ $pkgdir;
}
