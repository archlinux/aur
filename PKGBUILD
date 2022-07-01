# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
_name=bicep
pkgname=$_name-bin
pkgver=0.8.2 # renovate: datasource=github-tags depName=Azure/bicep
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
b2sums=('0ac3164ce8ff037423bf322bb1fb4d6b41925f3ef32a10e92683c62e47c31f7c29bf250a4b90ab27d109862f4830f341dcbff3b626c337906a19eeff479acb05'
        '1e0a143630bdf1d10e34a180d83b967ca132c6c976b5a7c93c1452b6747d3f05ed0aab8c7ef7436af61971ebab7b9fc6aa7378784e3776d8913c6825a6cb3e74')

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_name}"
}
