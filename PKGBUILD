# Maintainer: Jeremy Symon <jtsymon@gmail.com>
pkgname='key-logic'
pkgver=2.6.2
pkgrel=1
pkgdesc="A dynamic logic proof tool"
arch=('any')
url="http://www.key-project.org"
license=('GPL2')
depends=('bash' 'java-environment')
makedepends=('unzip')
source=(
  'https://formal.iti.kit.edu/key/releases/2.6.2/key-2.6.2_00c1abfd22b738afe24e89fecc2ee4eec2c38f4a.zip'
  'launcher'
)
sha256sums=(
  'ebf66973e077f4f0ebfa4c97eae1f14b6a57c02b06b1f8cf2b10542e59d37bf5'
  'c7ad44a846da4991ac2c5981649cf77cdb9ceae76dc2bd530e84e8b42f56566f'
)

package() {
  install -Dm755 'launcher' "$pkgdir/usr/bin/$pkgname"
  install -d "$pkgdir/usr/lib/$pkgname/"
  cp -r \
        'KeY.jar' 'components' 'libs' \
        "$pkgdir/usr/lib/$pkgname/"
}
