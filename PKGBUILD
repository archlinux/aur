# Maintainer: Trevor Facer <trevordf@protonmail.com>

pkgname=travis-conditions-bin
pkgver=1.0.9
pkgrel=1
pkgdesc="Boolean language for conditional builds, stages, jobs"
url="https://github.com/travis-ci/travis-conditions"

conflicts=('travis-conditions')
provides=('travis-conditions')
license=('MIT')
arch=('x86_64')

source=(
  "LICENSE::https://raw.githubusercontent.com/travis-ci/travis-conditions/master/LICENSE"
  "travis-conditions-${pkgver}.zip::https://github.com/travis-ci/travis-conditions/archive/v${pkgver}.zip"
)

sha256sums=(
  '17131f3b252bad007696ac5ae00aa17be922587bf5abc5e95fc53d716155aa7f'
  '0132c558cf9b9f85ae98a7c1f606e020f271f550ce2630e2b07080ed164c0dd7'
)

package() {
  echo "unzipping"
  unzip -d ./${pkgver} travis-conditions-${pkgver}.zip
  echo "installing license"
  install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  echo "installing travis-conditions"
  install -D -m 755 "${srcdir}/travis-conditions-${pkgver}/bin/travis-conditions" "${pkgdir}/usr/bin/${pkgname%-cli-bin}"
}

# vim:set ts=2 sw=2 et:
