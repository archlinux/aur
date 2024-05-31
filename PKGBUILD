# Maintainer:meow <sdfsdfaasdfdcf@gmail.com>

pkgname=mspaint-xp-bin
pkgver=2
depends=('wine')
pkgrel=1
arch=(x86_64)
pkgdesc="The classic MS PAINT of Windows XP"
license=("proprietary")
options=(!strip)
url="https://archive.org/details/MSPaintWinXP"
source=('mspaint' 'https://jestershelter.xyz/files/mspaint.zip' 'MSPaint.png' 'mspaint.desktop')

sha256sums=('5c9c20c7fa9aa242823c5edf4881e62030d9e46916902d1f87e16917faf54cce'
            'e90ad1b9cf6ee6566edf70818e3a6d422dd15f52ee37570260779a6ede871496'
            '185629daf451cda04ff0a364466664cd77c2dec075dd71b0cdb305c823f5b9c8'
            '7fd0003f601a21d9e50e85da8726e6c506079e8e01a7e13f592fb8cee6e3516b')

package() {
    _DESTINATION="$pkgdir/usr/share/mspaint-xp"
    mkdir -p $_DESTINATION

    find "$srcdir/le-epic-paint" -type f -exec \
        install -Dm 644 '{}' "$_DESTINATION" \;

    install -Dm 755 "$srcdir/mspaint" "$pkgdir/usr/bin/mspaint"
    mkdir -p "$pkgdir/usr/share/applications"
    install -Dm 644 "$srcdir/mspaint.desktop" "$pkgdir/usr/share/applications/mspaint.desktop"
    chmod +x "$pkgdir/usr/share/applications/mspaint.desktop"
    install -Dm 755 "$srcdir/MSPaint.png" "$_DESTINATION"
}
