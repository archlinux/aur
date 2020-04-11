# Maintainer: Sandor Nagy <sandor-dot-nagy-at-kdemail-dot-net>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-support
pkgver=r23.2.1
pkgrel=2
pkgdesc='Android Support Package'
arch=('any')
url="https://developer.android.com/sdk/compatibility-library.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/support_${pkgver}.zip" 'source.properties')
sha512sums=('390accebb79a41fda6bd01bbe1343c408af83aea2d216806ce56092a652b27bbec0bff32facb87d3d2325bd0e52ca9bb2fa73eacee36ba62c75717b4417bad66'
            'e2ee0fd0fe547bff9f4915b610c5cb1a46c88c014440bf592430a38f554f1cf212f4628cb370f4b619a02587992f59577ca42aee70f2f7e1dc57d0627ce3f28c')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/android/"
  mv "${srcdir}/support" "${pkgdir}/opt/android-sdk/extras/android/support"

  chmod -R ugo+rX "${pkgdir}/opt"
  install -Dm644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/android/support/source.properties"
}
