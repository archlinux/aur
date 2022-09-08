# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
_name=bicep
pkgname=$_name-bin
pkgver=0.10.13 # renovate: datasource=github-tags depName=Azure/bicep
pkgrel=1
pkgdesc="Bicep is a declarative language for describing and deploying Azure resources"
arch=('x86_64')
url="https://github.com/Azure/$_name"
license=('MIT')
provides=($_name)
conflicts=($_name)
options=('!strip')
source=("${pkgname}-${pkgver}::https://github.com/Azure/${_name}/releases/download/v${pkgver}/${_name}-linux-x64"
  "https://raw.githubusercontent.com/Azure/${_name}/v${pkgver}/LICENSE")
b2sums=('41885decce96fc567fdb24ea84ea4a2ae2d719115cdd03701e26fbcbb4831c513af94a325c2cb492f67c43e09cd9df719f0dfacd8b53f9709605eea4ac9282e1'
        '1e0a143630bdf1d10e34a180d83b967ca132c6c976b5a7c93c1452b6747d3f05ed0aab8c7ef7436af61971ebab7b9fc6aa7378784e3776d8913c6825a6cb3e74')

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_name}"
}
