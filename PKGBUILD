# Maintainer: Dhananjay Tanpure <dtan13@pm.me>

pkgname="xplorer-bin"
pkgver="0.3.1"
pkgrel=1
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
	"35b1ad3c63571b825b1bf9ccb0134df153c8ed8d0d29f0cefa898f5ea220669c"
)

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

