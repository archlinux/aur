# Maintainer: Hao Long <aur@esd.cc>

pkgname=jaeles
pkgver=0.8
pkgrel=1
pkgdesc='The Swiss Army knife for automated Web Application Testing'
arch=('x86_64' 'i686')
url="https://github.com/jaeles-project/jaeles"
license=('MIT')
provides=('jaeles')
conflicts=('jaeles')
depends=('glibc')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/beta-v${pkgver}.tar.gz")
sha256sums=('723d712e8f81028c4a6066c08b6ea49c8269381c7ae705fd304f0b34f0f4d3ba')

build() {
  cd ${pkgname}-beta-v${pkgver}
  go build -trimpath -ldflags "-extldflags ${LDFLAGS}" .
}

package() {
  cd ${pkgname}-beta-v${pkgver}
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
