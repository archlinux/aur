# Maintainer: Hao Long <aur@esd.cc>

pkgname=jaeles
pkgver=0.9
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
sha256sums=('18cb64ee3a7e3a2516b7e3d6568588f11112c8e8e21801e258fd9454496abf60')

build() {
  cd ${pkgname}-beta-v${pkgver}
  go build -trimpath -ldflags "-extldflags ${LDFLAGS}" .
}

package() {
  cd ${pkgname}-beta-v${pkgver}
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
