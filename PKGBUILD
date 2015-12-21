# Maintainer: Konstantin Gribov <grossws@gmail.com>

pkgname=cfssl
pkgver=1.1.0
pkgrel=1
pkgdesc="CloudFlare PKI and TLS toolkit"
arch=('i686' 'x86_64')
url="https://cfssl.org/"
license=('BSD')
depends=('glibc')
makedepends=('gcc-go' 'libtool')

source_x86_64=("cfssl::https://pkg.cfssl.org/R1.1/cfssl_linux-amd64"
               "cfssljson::https://pkg.cfssl.org/R1.1/cfssljson_linux-amd64"
               "cfssl_mkbundle::https://pkg.cfssl.org/R1.1/mkbundle_linux-amd64")
source_i686=("cfssl::https://pkg.cfssl.org/R1.1/cfssl_linux-386"
             "cfssljson::https://pkg.cfssl.org/R1.1/cfssljson_linux-386"
             "cfssl_mkbundle::https://pkg.cfssl.org/R1.1/mkbundle_linux-386")
source=("LICENSE::https://raw.githubusercontent.com/cloudflare/${pkgname}/${pkgver}/LICENSE")
sha256sums_x86_64=('92ef224956608685d22bd607d0bbd2cd957c2ea1adf42fdf1e977a3d1f3ff91c'
                   'a2b86daff6b52921d5149d6d4e1c12bfd609330e309aa80aeea8ee60af332257'
                   'df339a7a4be205f558c969db24ba0b37335cd9d2516974d2a2cb6933732afcc8')
sha256sums_i686=('6538c2618ab9600a925ef60c5a19841e1e96e72ad013cc54c03f4ccca7ebbec0'
                 '0cbeb9031e5b2ebf0184af2b1a4ec44162171c77374107117f785cb685f7ce96'
                 '3c7a81753edfe272cf97a5a9adc2319a573225d3acfe7b13365e6f9a15f9dfb9')
sha256sums=('dc439285c60b63ec585769cf151a03345654a78271cdfd56250f59f1175fba88')

package() {
  install -m755 -D -t "${pkgdir}/usr/bin/" cfssl cfssljson cfssl_mkbundle
  install -m644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
