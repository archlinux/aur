# Maintainer: Teoh Han Hui <teohhanhui@gmail.com>

pkgname=aniadd-bin
pkgver=20190803
pkgrel=1
pkgdesc='A very simple to use AniDB client (GUI)'
arch=('any')
url='https://anidb.net/perl-bin/animedb.pl?show=software'
license=('unknown')
depends=('java-runtime')

DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

source=('https://static.anidb.net/files/AniAdd.jar'
        'anidb-16x16.png::https://static.anidb.net/css/icons/touch/favicon-16x16.png'
        'anidb-32x32.png::https://static.anidb.net/css/icons/touch/favicon-32x32.png'
        'anidb-48x48.png::https://static.anidb.net/css/icons/touch/android-chrome-48x48.png'
        'anidb-72x72.png::https://static.anidb.net/css/icons/touch/android-chrome-72x72.png'
        'anidb-96x96.png::https://static.anidb.net/css/icons/touch/android-chrome-96x96.png'
        'anidb-192x192.png::https://static.anidb.net/css/icons/touch/android-chrome-192x192.png'
        'anidb-256x256.png::https://static.anidb.net/css/icons/touch/android-chrome-256x256.png'
        'anidb-512x512.png::https://static.anidb.net/css/icons/touch/android-chrome-512x512.png'
        'aniadd.sh'
        'aniadd.desktop')
noextract=('AniAdd.jar')
sha256sums=('1431edf48a1b3f2cc2d64c6982858410cfd70a906268e16095afc1b3d589b9a2'
            '6472e83d6dfe5975f2fbe811aeb39908b55fad629447159eae57bd9bd844328b'
            'bb906cdfe418ba32146f44b8c7ae00e091db6b10a9f3d982ad9eb81f85b5b4b3'
            'bcc777d4af19712bca7636dea9748af97ff9e5280d41956370fc1df528e37209'
            '3e0ffccb96a9e306013634a8d459467c587da508cb030a9ba2c2d2c44b8f1bc5'
            'bce5f01d153f268090cf5e00cdd88bb3e9cb55199078fd190cf3fc0ec1175832'
            '4c93222c76561f6f92d99ec2970adaceefcd258db100f1e6a1aba160fd17c8b6'
            'a804266132deefba9450d35881b834c0ced8312c3120ac7bb604871b62752437'
            '1e0ba81ccf76df99f11b7eaed1e685d3fb78798da8ecb329b6c714cf34f1416a'
            '0a732e65e2adbe523df87b47e632974900519a0ce86b360326c2b23e4d3af3ce'
            '126974fef75b181608412641fc56fefd8dc2e5fa6d4024897d1bb2a5dc1102d6')

package() {
    install -D -m 644 AniAdd.jar "$pkgdir/usr/share/java/aniadd/AniAdd.jar"
    install -D -m 755 aniadd.sh "$pkgdir/usr/bin/aniadd"
    install -D -m 644 aniadd.desktop "$pkgdir/usr/share/applications/aniadd.desktop"

    for size in 16x16 32x32 48x48 72x72 96x96 192x192 256x256 512x512; do
        mkdir -p "$pkgdir/usr/share/icons/hicolor/$size/apps"
        cp "anidb-$size.png" "$pkgdir/usr/share/icons/hicolor/$size/apps/anidb.png"
        ln -s anidb.png "$pkgdir/usr/share/icons/hicolor/$size/apps/aniadd.png"
    done
}
