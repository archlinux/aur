# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=surrealdb-studio-bin
pkgver=1.0.4
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
sha256sums_x86_64=('d517795e1384393e22c26bc38c6498b3cafbbbd1c1bbc619d395f2fa6823c0dd')
sha256sums_aarch64=('a77893305d462253f8a499aeb2001bb07c5a7b0b1ccac23b8393e978b46fa9c6')

package() {
	_arch="${arch//x86_64/amd64}"; _arch="${_arch//aarch64/arm64}"
	_debname="surrealdb-studio_${pkgver//_/-}_${_arch}.deb"
	bsdtar -O -xf "${_debname}" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
