# Maintainer: tarball <bootctl@gmail.com>

pkgname='tika-bin'
pkgver=2.9.0
pkgrel=1
pkgdesc='Apache Tika — detect and extract metadata and text from over a thousand file types'
arch=(any)
url='https://tika.apache.org'
license=(Apache)
provides=(tika)
conflicts=(tika)
depends=('java-runtime')
noextract=("tika-app-$pkgver.jar")
source=(
  "https://dlcdn.apache.org/tika/$pkgver/tika-app-$pkgver.jar"
  'tika.sh'
  'tika.desktop'
  'tika.svg'
)
sha256sums=('390382b0ad31a7da55d83cce58538f4b59988eda6ebdf259459d4ef109df1b06'
            'caf002fe624623a6598e1753e42400e58f951d37cdf2410aaf0fd8e6343bc5c5'
            '490cfc11aa05722a7831a3938a63df39b9d4d08e47e88b973479fffac17ce246'
            'ccae8a7ff8b30e73511e11f5c33facbf87d7e47db8cc86e14a52116ac96da9b7')

package() {
  install -Dm644 "tika-app-$pkgver.jar" \
    "$pkgdir/usr/lib/tika/tika-app.jar"

  install -Dm755 tika.sh "$pkgdir"/usr/bin/tika
  install -Dm644 tika.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/tika.svg"
  install -Dm644 tika.desktop "$pkgdir"/usr/share/applications/tika.desktop
}
