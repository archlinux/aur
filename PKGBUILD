# Maintainer: BrainDamage <braindamage springlobby.info>

pkgname=eqonomize
pkgver=1.4.2
pkgrel=1
pkgdesc='Efficient and easy accounting for the small household economy'
arch=('x86_64')
url='https://eqonomize.github.io/'
depends=('qt5-charts' 'qt5-base')
source=("https://github.com/Eqonomize/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1972efad7afad7c516cae8ef65894a4f205f722ab039748b132212cf7e1a6d8d')

# template start; name=qmake; version=1;
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
    qmake PREFIX=/usr \
    QMAKE_CFLAGS="${CFLAGS}" \
    QMAKE_CXXFLAGS="${CXXFLAGS}" \
    QMAKE_LFLAGS="${LDFLAGS}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
}
# template end;
