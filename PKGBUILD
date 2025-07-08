# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=hyprsunset-util
pkgver=0.0.1
pkgrel=1
pkgdesc='hyprsunset utility managing screen temperature'
url='https://github.com/abenz1267/hyprsunset-util'
arch=('x86_64')
license=('MIT')
makedepends=('go')
conflicts=('hyprsunset-util')
provides=('hyprsunset-util')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2afce77157d8993f93ca145bd2cfd659a9efe8c258ba72baab813d6b53df4e28')
b2sums=('56f215943ad0e3148f4007154131a0e85c6278f2b5c767e9059d74610b0a30e4c8d472e746fc484062cc3747669714ae57b4a2e37835ef6849ac8951a62ae949')

build() {
  cd ${pkgname}-${pkgver}

  go build -x -o hyprsunset-util
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 hyprsunset-util -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
