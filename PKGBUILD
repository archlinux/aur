# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgname=BetterBin
pkgname=betterbin
pkgver=1.0.r69
pkgrel=1
pkgdesc='Various useful shell scripts to increace productivity and efficiency in your workflow'
arch=(x86_64)
url="https://gitlab.com/qYp/${pkgname}"
license=('MIT')
depends=()
makedepends=(git)                 
source=(
  "https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}.pkg.tar.zst"
  "https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}.pkg.tar.zst.sig")
md5sums=(
  '882429c3a102dd7a999b78e77746e40c'
  '3bb588cb0bb9d923de205329dd5173d9')

pkgver() {
  printf "1.0.r""$(git rev-list --count HEAD)"
}

package() {
  install -Dm775 usr/bin/* -g wheel -o ${USER} -t "${pkgdir}/usr/bin/"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
