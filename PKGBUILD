# Maintainer:F43nd1r <support@faendir.com>

pkgname=ts3audiobot
pkgver=0.11.0
pkgrel=1
epoch=
pkgdesc="ts3 audio bot by splamy"
arch=('any')
url="https://github.com/Splamy/TS3AudioBot"
license=('custom:OSL 3.0')
depends=('mono' 'opus' 'ffmpeg')
makedepends=('unzip')
optdepends=('youtube-dl')
source=("$pkgname-$pkgver.zip::https://splamy.de/api/nightly/ts3ab/master/download" 
        "ts3audiobot.sh" 
        "LICENSE")
noextract=("$pkgname-$pkgver.zip")
md5sums=(SKIP
         'bfa2408c0be947b50d87bae0a9c91be4'
         'f03380651f2a7879bbf28b1725fd3838')
sha256sums=(SKIP
            '22105154b20e158bdafcf7884bd9a16df9f9e68b618f62761c1d9c6462f8efa1'
            '34b20c0f1f71a454990c21f34a4016ff35337403dbc2515f0dca9256b7c88093')

prepare() {
    unzip -q "$pkgname-$pkgver.zip" -d "$srcdir/$pkgname-$pkgver"
}
package() {
    cd $srcdir
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -d $pkgdir/{opt/$pkgname,usr/bin}
    cp ts3audiobot.sh $pkgdir/usr/bin/$pkgname
    cp -a $pkgname-$pkgver/* $pkgdir/opt/$pkgname
    chmod -R ugo+rX $pkgdir/opt
}
