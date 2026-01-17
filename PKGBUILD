# Maintainer: Evan Sosenko <razorx@evansosenko.com>
pkgname=dynocsv-bin
pkgver=1.1.4
pkgrel=1
pkgdesc="Exports DynamoDB table into CSV"
arch=('x86_64')
url="https://github.com/zshamrock/dynocsv"
license=('MIT')
provides=('dynocsv')
conflicts=('dynocsv')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zshamrock/dynocsv/archive/v${pkgver}.tar.gz"
        "${pkgname}-${pkgver}-dynocsv::https://github.com/zshamrock/dynocsv/releases/download/v${pkgver}/dynocsv")
sha256sums=('d1bf8ef2ad8b2c99385ddea2fa933b2fe7514df39f961f1b42abf9a199ab4bba'
            '85f26284eb3ec0dffe089639449eec8ada893b95c6150bfdfd183b9ad00b0e62')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-dynocsv" "$pkgdir/usr/bin/dynocsv"

  cd "$srcdir/dynocsv-$pkgver"

  mkdir -p "${pkgdir}/usr/share/licenses/dynocsv/"
  install -Dm644 ./LICENSE* "${pkgdir}/usr/share/licenses/dynocsv/"
}
