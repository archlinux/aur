# Maintainer: Dhananjay Tanpure <dtan13@pm.me>

pkgname="xplorer-bin"
pkgver="0.3.1"
pkgrel=2
pkgdesc="Xplorer, a customizable, modern file manager"
arch=("any")
license=("custom")
url="https://xplorer.space"

depends=(
    'webkit2gtk'
)

source=(
	"https://github.com/kimlimjustin/xplorer/releases/download/v${pkgver}/xplorer_${pkgver}_amd64.deb"
	"https://raw.githubusercontent.com/kimlimjustin/xplorer/master/LICENSE"
)

sha256sums=(
	"b1f18cc3f079aa52dc38afa69ee2a81d283162f444a5787163f6bc17ed070e34"
    "fc990ed41503ed277894924ba883b9c8fb00794145d0eb5805f5e6b5bccc8916"
)

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

