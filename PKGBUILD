# Maintainer: axionl <axionl@aosc.io>
pkgname=skm
pkgver=0.8.4
pkgrel=1
pkgdesc="A simple and powerful SSH keys manager"
provides=('skm')
depends=('glibc')
makedepends=('git' 'go')
arch=('x86_64')
url="https://github.com/TimothyYe/skm"
license=('MIT')
source=("${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}")

b2sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/cmd/skm/"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/skm/"
  install -Dm755 "cmd/skm/skm" -t "${pkgdir}/usr/bin/"
}
