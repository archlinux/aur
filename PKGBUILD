# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=surrealdb-studio-bin
pkgver=1.1.0
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
sha256sums_x86_64=('2752dc1dba88ac13d03e081bce2182d99e5db2f805a5269ebcb7d2f917a67cdd')
sha256sums_aarch64=('eceefce7f21a727941d7350fd985ee208afa04e7806f93aea058b0f62884dc9c')

package() {
	_arch="${arch//x86_64/amd64}"; _arch="${_arch//aarch64/arm64}"
	_debname="surrealdb-studio_${pkgver//_/-}_${_arch}.deb"
	bsdtar -O -xf "${_debname}" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
