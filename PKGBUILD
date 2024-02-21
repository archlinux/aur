# Maintainer: Amolith <amolith@secluded.site>
pkgname="watt-wiser-bin"
_pkgname=${pkgname%-bin}
pkgdesc="A software energy consumption estimation tool"
_repo="watt-wiser"
pkgver=v0.0.6
pkgrel=1
arch=("any")
url="https://github.com/wattwisegames/$_repo"
source=("${_repo}-${pkgver}-linux.tar.xz"::"${url}/releases/download/${pkgver}/${_repo}-${pkgver}-linux.tar.xz")
license=("Unlicense")
provides=($_pkgname)
conflicts=("$_pkgname" "watt-wiser-git" "watt-wiser-sensors-git")

sha256sums=('63706f77013f1aeb6b48230e3fa9ed4b67c943f9fc21035cc4d02efd12cbe32a')
sha512sums=('4341f618578ae7a32b381bf16032081727bf5bbdd4c24a595c84b53871b4faa5c00e7f60816ffe2690d062ed68cddb6263dfc792f7c6d5df9807e4aef2ba7165')
b2sums=('d2b8efc2a8352cd82d30416942608ec0e4924e8b146bda6131061802c26dd02c025eb88929877a5438521afe0115765d5ab7334b04a8b3956cafb2c0de18a32d')

package() {
  cd "${_repo}-${pkgver}-linux"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
