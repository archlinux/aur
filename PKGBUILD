# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=linux-ck-autobuild
pkgver=0.7.2
pkgrel=1
pkgdesc="A tool to automatically build linux-ck kernels on a headless machines"
arch=(any)
url="https://github.com/nebulosa2007/${pkgname}-service"
license=(GPL3)
depends=(bash base-devel git)
optdepends=('fzf: for selecting subarches')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz
        ${pkgname}@.service
        ${pkgname}@.timer)
sha256sums=('46a0f7d368a8330b08b0d46ef57a84a1c9787151811a2cf60b0419dfa6f116a0'
            '23f2d1683b91517465b631aa50e0cdf194960704323cfbf1971c45f1a6d71c4f'
            '2d576af5539a77774d6e549f5b62a359ce6dcc12972e94e2d6848eae7388c55d')

package() {
  install -Dm755 ${pkgname}-service-${pkgver}/${pkgname} -t ${pkgdir}/usr/bin/
  install -Dm644 ${srcdir}/${pkgname}@.{service,timer}   -t ${pkgdir}/usr/lib/systemd/system/
}
