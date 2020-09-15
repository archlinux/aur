# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
_name=bicep
pkgname=$_name-bin
pkgver=0.1.37
pkgrel=1
pkgdesc="Bicep is a Domain Specific Language (DSL) for deploying Azure resources declaratively."
arch=('x86_64')
url="https://github.com/Azure/$_name"
license=('MIT')
provides=($_name)
conflicts=($_name)
options=('!strip')
source=("${pkgname}-${pkgver}::https://github.com/Azure/${_name}/releases/download/v${pkgver}-alpha/${_name}-linux-x64"
  "https://raw.githubusercontent.com/Azure/${_name}/v${pkgver}-alpha/LICENSE")
b2sums=('3a8f676369d51d71a031adc07e013faf3add217d84902ac5a3eb657c95cc74f4271dc25390e11c7b8cff8fc7f8eaedf02c1fffd729ebca4d20824646bd25f354'
        '1e0a143630bdf1d10e34a180d83b967ca132c6c976b5a7c93c1452b6747d3f05ed0aab8c7ef7436af61971ebab7b9fc6aa7378784e3776d8913c6825a6cb3e74')

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_name}"
}
