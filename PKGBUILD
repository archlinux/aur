# Maintainer: weearc <qby19981121@gmail.com>

pkgname=purple-oicq
pkgver=1.0.1
pkgrel=1
pkgdesc='A libpurple plugin'
url='https://github.com/axon-oicq/purple-oicq'
license=(Unlicense)
arch=(x86_64)
depends=('libpurple'
          'json-c'
        )
makedepends=('make' 'gcc' 'libtool')
optdepends=('pidgin: For GUI usage of qicq'
            'finch: For cli usage of qicq'
            'axon: qicq backend'
            )
source=("https://github.com/axon-oicq/purple-oicq/archive/refs/tags/v1.0.1.zip")
sha256sums=('da5621774eb4a34695d272508a872aa750d9a236519c52969a4016ef62c6e556')

build() {
  cd ${srcdir}
  cd $pkgname-$pkgver
  make
}

package() {
  install -d ${pkgdir}/usr/lib/purple-2
  install -Dm644 ${srcdir}/$pkgname-$pkgver/libpurple-oicq.so ${pkgdir}/usr/lib/purple-2/libpurple-oicq.so
}
