# Maintainer: Michael Straube <m.s.online gmx.de>
pkgname=x-corners
pkgver=0.1.0
pkgrel=1
pkgdesc='A commandline tool to set up hot corners under X11'
arch=('i686' 'x86_64')
license=('MIT')
url='https://github.com/mis2/x-corners'
depends=('libxi')
makedepends=('libxfixes')
source=("https://github.com/mis2/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c6c0df0127dfc1c4d196ff9cb854c3a152b4c8025d9c6096cdbbca64c41ee4c8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
