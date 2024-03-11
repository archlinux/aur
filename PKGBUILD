# Maintainer: Amolith <amolith@secluded.site>
pkgname="watt-wiser-sensors-bin"
_pkgname=${pkgname%-bin}
pkgdesc="A software energy consumption estimation tool"
_repo="watt-wiser"
pkgver=v0.0.8
pkgrel=1
arch=("any")
url="https://github.com/wattwisegames/$_repo"
source=("${_repo}-${pkgver}-linux.tar.xz"::"${url}/releases/download/${pkgver}/${_repo}-${pkgver}-linux.tar.xz")
license=("Unlicense")
provides=($_pkgname)
conflicts=("$_pkgname" "watt-wiser-git" "watt-wiser-sensors-git")
depends=("lm_sensors")

sha256sums=('6db5612ede2c6307f24047e7c9a82223536fc2c97c81e0e6b774877b8d280634')
sha512sums=('3f41194f5c1b88bb2e3e35b3363657e11568c1909aaea755790f31d61d8e5ba0448dfe4e1fb78f9e291ca9ea24cd307e56fffdb584fd1e51e1c2f28f24e95f12')
b2sums=('df5b85474a505b0ac3e852fb1ffe2883d58411a0fa00a83f223b1209bdd3fc575a9c8aa48e9f719ca59bb0f594bcdd938c77f71ec68f4bf0138a7c86fea252ba')

package() {
  cd "${_repo}-${pkgver}-linux"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
