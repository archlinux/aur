# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=surrealdb-studio-bin
pkgver=1.10.0
pkgrel=1
pkgdesc="SurrealDB Studio, the new official app of SurrealDB"
arch=("x86_64" "aarch64")
url="https://studio.surrealdb.com"
license=("custom:Unknown-Proprietary")
depends=(bash glibc gcc-libs libsecret glib2 hicolor-icon-theme)
provides=("surrealdb-studio")
optdepends=('surrealdb: non-sandboxed SurrealDB instance')
source_x86_64=("https://download.surrealdb.com/studio/v${pkgver//_/-}/surrealdb-studio_${pkgver//_/-}_amd64.deb")
source_aarch64=("https://download.surrealdb.com/studio/v${pkgver//_/-}/surrealdb-studio_${pkgver//_/-}_arm64.deb")
sha256sums_x86_64=('29aea1586611df94311f5f35cfa5ab78beef8382654c2add6c81a08efc48faf0')
sha256sums_aarch64=('73055f4ba7651294c322b91c6d0f5d76b2ae7c4af383496dc0ef2f3c9a24cd78')

package() {
	_arch="${arch//x86_64/amd64}"; _arch="${_arch//aarch64/arm64}"
	_debname="surrealdb-studio_${pkgver//_/-}_${_arch}.deb"
	bsdtar -O -xf "${_debname}" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
