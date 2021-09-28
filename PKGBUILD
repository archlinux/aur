# Maintainer: Dhananjay Tanpure <dtan13@pm.me>

pkgname="xplorer-bin"
pkgver="0.1.0"
pkgrel=1
pkgdesc="Xplorer, a customizable, modern file manager"
arch=("any")
license=("custom")
url="https://xplorer.vercel.app"

source=(
	"https://github.com/kimlimjustin/xplorer/releases/download/v${pkgver}/xplorer_${pkgver}_amd64.deb"
	"https://raw.githubusercontent.com/kimlimjustin/xplorer/master/LICENSE"
	"xplorer"
)

sha256sums=(
	"6daf0cbc77606d767dd41d871c2de46726c5d6120ee5b7d16d8f0801246f53f5"
	"35b1ad3c63571b825b1bf9ccb0134df153c8ed8d0d29f0cefa898f5ea220669c"
	"135ec298fb64e242f04adbffed7d73a3ceb63c839d570d841d6e3ff36672421a"
)

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir ${pkgdir}/usr/bin
  cp "${srcdir}/xplorer" "${pkgdir}/usr/bin/xplorer"
  chmod +x "${pkgdir}/usr/bin/xplorer"
}

