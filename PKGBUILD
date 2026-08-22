# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=surrealdb-studio-bin
pkgver=1.0.10
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
sha256sums_x86_64=('5c64d4ef7e3282e81ffef222be841570a1965adbdc0715a4751c32665e187b74')
sha256sums_aarch64=('125f6d9ceca671a8d8cfdbd7cfed1974e63366068238fd18601bccaf978bc64b')

package() {
	_arch="${arch//x86_64/amd64}"; _arch="${_arch//aarch64/arm64}"
	_debname="surrealdb-studio_${pkgver//_/-}_${_arch}.deb"
	bsdtar -O -xf "${_debname}" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
