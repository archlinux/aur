# Maintainer: Amolith <amolith@secluded.site>
pkgname="watt-wiser-bin"
_pkgname=${pkgname%-bin}
pkgdesc="A software energy consumption estimation tool"
_repo="watt-wiser"
pkgver=v0.1.2
pkgrel=1
arch=("any")
url="https://github.com/wattwisegames/$_repo"
license=("Unlicense")
conflicts=("watt-wiser-git" "watt-wiser-sensors-git")
depends=("watt-wiser-sensors" "xdg-desktop-portal")

source=("${_repo}-${pkgver}-linux.tar.xz"::"${url}/releases/download/${pkgver}/${_repo}-${pkgver}-linux.tar.xz")
b2sums=('6270f05c7c3cbdee562738ee0ed796f0fa8d731b995ac233253984e1ecf82327b1328d8959652c48c74b699591d0e83f2300c509cb8eec63dd69f65bb1c7d8a8')

package() {
  cd "${_repo}-${pkgver}-linux"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
