# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
_name=bicep
pkgname=$_name-bin
pkgver=0.10.61 # renovate: datasource=github-tags depName=Azure/bicep
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
b2sums=('7138cdb86d9162728dc3abd8a641a764ba09d76bb8cd125dfc27afc1721da3bf2fe4bd68c46c021a405445044039aff3d3a803bdf0009c51a9ef990d238e0f53'
        '1e0a143630bdf1d10e34a180d83b967ca132c6c976b5a7c93c1452b6747d3f05ed0aab8c7ef7436af61971ebab7b9fc6aa7378784e3776d8913c6825a6cb3e74')

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_name}"
}
