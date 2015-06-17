# Maintainer: yozi <es.mslj TA xunilhcra> backwards
# Contributor: yozi <es.mslj TA xunilhcra> backwards
pkgname='unqlite-unofficial'
pkgver='1.1.6'
pkgrel=2
pkgdesc='Embeddable NoSQL DB Engine library with unofficial patches from the tocc project (http://t-o-c-c.com)'
arch=('i686' 'x86_64')
url='http://unqlite.org'
license=('BSD')
depends=('glibc')
conflicts=('unqlite' 'unqlite-lib' 'unqlite-interp' 'unqlite-samples')
provides=('unqlite-lib')
optdepends=('unqlite-doc: official documentation')
source=("https://github.com/aidin36/tocc/releases/download/v1.0.1/${pkgname}-${pkgver}.tar.gz"
        "LICENSE")
validpgpkeys=(# Aidin Gharibnavaz <aidin@t-o-c-c.com>
              'FC34B251315AF6668AA1FB30F8A5FC9979B75433')
sha256sums=('7acc88b500f6ceeb622fd65e161b59e4cd3ce6c12678762bc04dbd121edc77e9'
            '643698d5116871a69553fe323b93c8ac5043d244d01f59772d8be4aeaafef2bc')
sha384sums=('00b949e8fc07f6dd360e4578c3c568b288c3c8c2ed3dbd55eac3a01c18c9cc1648b2d040e16bb52a39ee9841efc829fa'
            '77bb30418f4c33b91280c20ebfd652126441bd054172a1186574cbe44ddda87981cbb6b1850487be41d67a418cea9046')
sha512sums=('a781a257f8d16d638b0a2f1f48a265fe9f7dec444d81e1048b5dfb4d8b38796151b0e8271c656b542e15aea7d22bedde847e2d0569379cdfa9b2360ba9209212'
            'ad8e3962c5037598ba6d88c04c70fab626b1ae9498c4cab7710d2eb962108ff55349b0f113750d3380cd75d294bfb499cdc59ae7db0a9deb51a85e19f7ac1343')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
