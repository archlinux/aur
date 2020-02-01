pkgname=mfcoin-bin
pkgver=0.8.1
pkgrel=0
provides=('mfcoin' 'mfcoin-daemon')
conflicts=('mfcoin-git' 'mfcoin')
pkgdesc="MFCoin is a digital currency and blockchain service platform."
arch=('x86_64')
depends=("libevent>=2.1.8" "qt5-base" "dbus>=1.10.14" "miniupnpc>=2.0.20170509" "expat>=2.2.0" "freetype2>=2.7.1" "protobuf" "libdb-4.8")
url="https://mfcoin.net/"
license=('GPL3')

source_x86_64=(
    "https://github.com/MFrcoin/MFCoin/releases/download/v.${pkgver}.${pkgrel}/mfcoin-${pkgver}-linux.zip"
    'mfcoin.desktop'
    'mfcoin.svg'
)
sha256sums_x86_64=(
    '0d60a09b71c285b14b517a45872a9ded3180390612883385d1a6c6d65079ff49'
    '6e66f05d3c794cacbb1858b0578737572fa5ce8bae4a73e1b6d71adfc0f8765c'
    '0f1076e814656a476de97cf7c3773be8f3788a4ca3c13e64d800ad829571edd6'
)

package() {
    mkdir -p "$pkgdir"/usr/bin
    mkdir -p "$pkgdir"/usr/share/applications
    mkdir -p "$pkgdir"/usr/share/icons
    cp "$srcdir"/mfcoin.desktop "$pkgdir"/usr/share/applications
    cp "$srcdir"/mfcoin.svg "$pkgdir"/usr/share/icons
    cp "$srcdir"/mfcoin-qt "$pkgdir"/usr/bin
}
