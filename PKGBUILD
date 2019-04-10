# Maintainer: Jan Murawski <jm at rq-project dot net>

pkgname='rust-dependency-refresh'
pkgver="0.1.0"
pkgrel=1
pkgdesc='rust dependency updater'
url='https://github.com/RoffelKartoffel/dependency-refresh'
license=(
 'LGPL3'
)
source=(
 "https://github.com/RoffelKartoffel/dependency-refresh/archive/${pkgver}.tar.gz"
)
sha512sums=('c7a585fd6e3134032397ece75fcb0c1ebc8b14fd143c1cce0f5d08655d21c54f92081350fe2227e511505832916b5fa950e7afd11a5e9c22122ec6919880313f')
arch=(
 'x86_64'
 'i686'
)
depends=(
 'openssl'
)
makedepends=(
 'rust'
)

build() {
 pushd "dependency-refresh-${pkgver}"
 cargo build --release
 popd
}

package() {
 mkdir -p $pkgdir/usr/bin/
 install "${srcdir}/dependency-refresh-${pkgver}/target/release/dr" "$pkgdir/usr/bin/"
}
