# Maintainer:Bipin Kumar <kbipinkumar@pm.me>

pkgname=parafly
_pkgname=ParaFly
pkgver=0.1.0
pkgrel=1
pkgdesc='parallel command processing using OpenMP' 
arch=(x86_64)
url="https://github.com/ParaFly/ParaFly"
license=('BSD-3')
depends=('glibc' 'openmp' 'gcc-libs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ParaFly/ParaFly/archive/refs/tags/v${pkgver}.tar.gz"
        )
b2sums=('7f98ea21e9970bee227f4b2525dd1b3c514ac063ff0733ea36f98153d5a58b6a75a5ae3d57ead3fde6f88a2a5874911c607655458f48b1aea94e0bbe78ecddb4')

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr
  make 
}

package() {
    cd ${_pkgname}-${pkgver}
    make DESTDIR=${pkgdir}/ install
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
