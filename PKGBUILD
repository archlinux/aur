# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=surrealdb-studio-bin
pkgver=1.0.5
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
sha256sums_x86_64=('45dee792fd40a95728fd3f914c73af32426482083a3f07eb5e6c4dc0b2c2774d')
sha256sums_aarch64=('4c063f553eccf7dd0d3527d31a4649831360b93905366c156e01b5919ba3dc8c')

package() {
	_arch="${arch//x86_64/amd64}"; _arch="${_arch//aarch64/arm64}"
	_debname="surrealdb-studio_${pkgver//_/-}_${_arch}.deb"
	bsdtar -O -xf "${_debname}" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
