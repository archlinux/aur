# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
_name=gitsign
pkgname=$_name-bin
pkgver=0.1.1 # renovate: datasource=github-tags depName=sigstore/gitsign
pkgrel=1
pkgdesc='Keyless Git signing using Sigstore'
arch=('x86_64')
url='https://github.com/sigstore/gitsign'
license=(APACHE)
provides=($_name)
conflicts=($_name)
options=('!strip')
source=("${pkgname}-${pkgver}::https://github.com/sigstore/${_name}/releases/download/v${pkgver}/${_name}_${pkgver}_linux_amd64"
  "https://raw.githubusercontent.com/sigstore/${_name}/v${pkgver}/LICENSE")
b2sums=('b9f7ff4190870f0f935c5bd819f7dda0dfef0eba767f315cd2a296a0f9ecff1fbf1af99fa54d69280385929fcdbae36926dcf57a837fae550734b6867437d54a'
  '43452dd4216bba835bff542c02fcd0a80b77fef97a6f1042adcbbbcf312bb856b0707c35b2f1af356e0b4262e501a159f06bf1f947f182d0023cdd4aefbd8a85')

package() {
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_name}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
