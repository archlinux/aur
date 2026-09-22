# Maintainer: 5unekku <swagalicious@awesomsauce.net>
_pkgname=typescript
pkgname=${_pkgname}-bin
pkgver=7.0.2
pkgrel=1
pkgdesc="TypeScript is a superset of JavaScript that compiles to clean JavaScript output."
arch=("armv7h" "aarch64" "loong64" "mips64el" "ppc64" "riscv64" "s390x" "x86_64")
url="https://www.typescriptlang.org/"
license=('Apache-2.0')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("typescript")
conflicts=("typescript")
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
sha256sums=()
validpgpkeys=("BC528686B50D79E339D3721CEB3E94ADBE1229CF")

source_armv7h=("${_pkgname}-linux-arm.tgz::https://github.com/microsoft/TypeScript/releases/download/v7.0.2/${_pkgname}-linux-arm.tgz")
sha256sums_armv7h=("33a15a7badb207a38957373c410b970319baac8960109232ab64502497caea06")

source_aarch64=("${_pkgname}-linux-arm64.tgz::https://github.com/microsoft/TypeScript/releases/download/v7.0.2/${_pkgname}-linux-arm64.tgz")
sha256sums_aarch64=("c83d931ac9dd7549cde6e71246aa9d6a9812843023df3e277fe3b5dcf41dd0ea")

source_loong64=("${_pkgname}-linux-loong64.tgz::https://github.com/microsoft/TypeScript/releases/download/v7.0.2/${_pkgname}-linux-loong64.tgz")
sha256sums_loong64=("4d0a2d19f0563df4d12b1e4197a5aefc9827b2977aa48282e7647926085d3c1f")

source_mips64el=("${_pkgname}-linux-mips64el.tgz::https://github.com/microsoft/TypeScript/releases/download/v7.0.2/${_pkgname}-linux-mips64el.tgz")
sha256sums_mips64el=("6743a786c65e33b5b17d34bd9f2a66446dce95dc028cf21b6e6a975e7f576352")

source_ppc64=("${_pkgname}-linux-ppc64.tgz::https://github.com/microsoft/TypeScript/releases/download/v7.0.2/${_pkgname}-linux-ppc64.tgz")
sha256sums_ppc64=("8c30ad95ff40cff8bba2ab294abde3bfee6fa12b2b649f80ec90ef3188842db1")

source_riscv64=("${_pkgname}-linux-riscv64.tgz::https://github.com/microsoft/TypeScript/releases/download/v7.0.2/${_pkgname}-linux-riscv64.tgz")
sha256sums_riscv64=("b5afba89cef6c1c9e6142893018fdbd04183abe1e281a710fe31bb9578d2dc72")

source_s390x=("${_pkgname}-linux-s390x.tgz::https://github.com/microsoft/TypeScript/releases/download/v7.0.2/${_pkgname}-linux-s390x.tgz")
sha256sums_s390x=("badc50ce68cd84c462fcbddfe0c8a7acf9b16a334397cc73e889f6e783f1903d")

source_x86_64=("${_pkgname}-linux-x64.tgz::https://github.com/microsoft/TypeScript/releases/download/v7.0.2/${_pkgname}-linux-x64.tgz")
sha256sums_x86_64=("7ecad6f67377e831856367ab062ef394f21506a611405bf8ac0ff039348637d3")

prepare() {
	cd "${srcdir}/package"
	gpg --verify lib/tsc.sig lib/tsc
}

package() {
	cd "${srcdir}/package"
	install -Dm755 lib/tsc "${pkgdir}/usr/lib/${_pkgname}/tsc"
	install -m644 lib/*.d.ts -t "${pkgdir}/usr/lib/${_pkgname}/"

	install -d "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${_pkgname}/tsc" "${pkgdir}/usr/bin/tsc"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
