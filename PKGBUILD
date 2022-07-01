# Maintainer:   Maximilian Weiss <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Mike Caldwell


pkgname=btcaddress-alpha-bin
pkgver=0.0.1
pkgrel=3


pkgdesc="Casascius Bitcoin Address Utility"

arch=('i686' 'x86_64')

url='https://web.archive.org/web/20130712011038/https://casascius.wordpress.com/2013/01/26/bitcoin-address-utility/'
#url='https://casascius.wordpress.com/2013/01/26/bitcoin-address-utility/'
#url='https://github.com/casascius/Bitcoin-Address-Utility'

license=('Unknown' 'custom:FOSS')

depends=('mono')

provides=('btcaddress-alpha-bin')
conflicts=('btcaddress-alpha-bin')

source=('btcaddress.png'
        'btcaddress.desktop'
        "btcaddress-alpha.zip::https://web.archive.org/web/20140110122807/http://casascius.com/btcaddress-alpha.zip")

# https://casascius.com/btcaddress-alpha.zip
# Casascius site is no longer available

# Backups:
# https://ipfs.io/ipfs/QmcbgvdV5qaezKG5tLJ71GXKdikpoH3zHBfNc4SGdbLYN2
# https://web.archive.org/web/20130712011038/https://casascius.wordpress.com/2013/01/26/bitcoin-address-utility/


sha256sums=('3e7e6fcfa81a8617414198c46dfa0fa3489c96ac216e902ec5fabfeb664a9442'
            'ec7183ad277d2ccb01e6f8b6099b750fbf974b9acfb3e7139d21b8b54ccee535'
            '008b92949bbcedebc8da278e2c27156a35b3041e232a4e426efce471a6f2506e')

package() {
    mkdir -p "$pkgdir/opt/btcaddress/"
    mkdir -p "$pkgdir/usr/share/applications/"
    mkdir -p "$pkgdir/usr/share/pixmaps/"
    install -Dm644 "$srcdir/btcaddress.png" "$pkgdir/usr/share/pixmaps/"
    install -Dm644 "$srcdir/btcaddress.desktop" "$pkgdir/usr/share/applications/"
    rm -f "$srcdir/btcaddress.png"
    rm -f "$srcdir/btcaddress.desktop"
    rm -f "$srcdir/btcaddress-alpha.zip"
    rm -f "$srcdir/source.zip"
    cd "$srcdir/"
    for i in *.*; do
        install -Dm644 "$srcdir/$i" "$pkgdir/opt/btcaddress/"
    done
}
