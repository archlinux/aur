# Maintainer:F43nd1r <support@faendir.com>

pkgname=ts3audiobot
pkgver=0.12.2
pkgrel=1
epoch=
pkgdesc="ts3 audio bot by splamy"
arch=('x86_64')
url="https://splamy.de/TSAudioBot/Home"
license=('custom:OSL 3.0')
depends=('opus' 'ffmpeg')
optdepends=('youtube-dl')
source=("$pkgname-$pkgver.tar.gz::https://splamy.de/api/nightly/ts3ab/master_linux_x64/download" 
        "ts3audiobot.sh" 
        "LICENSE")
options=(!strip)
md5sums=(SKIP
         '9d50a7f09625d5f6b1b5e270b7ac38de'
         'f03380651f2a7879bbf28b1725fd3838')
sha256sums=(SKIP
            'd60b02115a3d8accfd52ffb7cc9018de9d23497e4e6fbdfd97a2d69399a7890d'
            '34b20c0f1f71a454990c21f34a4016ff35337403dbc2515f0dca9256b7c88093')

package() {
    cd $srcdir
    install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -D ts3audiobot.sh $pkgdir/usr/bin/$pkgname
    install -d $pkgdir/usr/lib/$pkgname
    cp -a WebInterface $pkgdir/usr/lib/$pkgname/
    cp -a TS3AudioBot $pkgdir/usr/lib/$pkgname/
}
