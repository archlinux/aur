# Maintainer: Vincent van Donselaar <vincent@van-donselaar.nl>
pkgname=fiddler
pkgver=4.4.8.4
pkgrel=1
pkgdesc="The free web debugging proxy by Telerik (running on mono)"
arch=('any')
url="http://getfiddler.com/"
license=('custom')
groups=()
depends=('mono')
makedepends=('unzip')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("http://ericlawrence.com/dl/MonoFiddler-v4484.zip"
		"LICENSE"
		"fiddler.desktop"
		"fiddler.png")
sha1sums=('37bd8a58d02dae2455d9517af98703e9b833e5df'
		'7f96e962d882d554b2a606d3f76bc3dd85c9fdd1'
		'bee1aeabed80319c5c24b7930bf763b982675b58'
		'f92dd0c975af05de485ad9be49b209a3d88be346')

package() {
  cd "$pkgdir"

  # The license should be in /usr/share/licenses.
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Desktop file
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/opt/${pkgname}/${pkgname}.png"

  mkdir -p opt
  cp -a "${srcdir}/app/." "${pkgdir}/opt/${pkgname}/"
}
