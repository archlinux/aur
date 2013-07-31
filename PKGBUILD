# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=fsport-tangovps
pkgver=3.4
pkgrel=1
pkgdesc="Hi-res Command Brief animations for FSPort"
arch=('any')
url="http://fsport.hard-light.net/website/"
license=('custom:noncommercial')
depends=('fsport')
makedepends=('unzip')
source=(LICENSE
        'http://fsport.freespacemods.net/releases/tango_hi1_fs1.zip'
        'http://fsport.freespacemods.net/releases/tango_hi2_fs1.zip'
        'http://fsport.freespacemods.net/releases/tango_hi3_fs1.zip'
        'http://fsport.freespacemods.net/releases/tango_hi4_fs1.zip'
        'http://fsport.freespacemods.net/releases/tango_hi5_fs1.zip')
sha256sums=('79462ffe82b8cf371f37a3444a8e17165d293e797a865b9c4312f86d00ddf4ec'
            '9e300d53845236c54e56bd9a188d17718313f522a1c4d2554de49a79e9847cfc'
            'b15fab3d3bfe3a2b760cb0f9188622ff6513c9cf953a8da45aa62e2295746f4b'
            '094fbcc25006f1f46e9c19a06b0073384e6b0e15e5935231bdd89672429b6515'
            'cfd92227f925b4c51c52f04ddf1fcdc5e72d30bae84d10f44d84d5da1ea811df'
            '7178370ba921e15963e2437c652d5fef0252a406f5ac565e218dd779cfe110bf')

# Prevent compression
PKGEXT=".pkg.tar"

package() {
  cd "$srcdir"

  install -D -m 644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

  mkdir -p "$pkgdir"/opt/fs2_open/fsport || return 1

  # Not really proper to use mv, but saves space and time
  mv *.vp "$pkgdir"/opt/fs2_open/fsport
}
