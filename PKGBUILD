# Maintainer: pancho horrillo <pancho at pancho dot name>

_name=kapow
_pkgname="${_name}bang"
pkgname="${_pkgname}-bin"
pkgver=0.3.0
pkgrel=1
pkgdesc='If you can script it, you can HTTP it.'
arch=('x86_64' 'i686' 'aarch64' 'arm6h')
url='https://github.com/BBVA/kapow'
license=('Apache')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_source="$url/releases/download/v$pkgver/${_name}_${pkgver}_linux"
source=("$url/releases/download/v$pkgver/${_name}-${pkgver}-SHA512SUMS.GPG")
source_x86_64=("${_name}_x86_64::${_source}_amd64")
source_i686=("${_name}_i686::${_source}_386")
source_aarch64=("${_name}_aarch64::${_source}_arm64")
source_arm6h=("${_name}_arm6h::${_source}_armv6")
sha512sums=('e26a6cb6b073f47ba84a5f6c88c8031711314b1f137dc73b9115d6fdcc8b6af38ec3c5f56c88ae00d04afcb4c5e6aff3e713ead5da434480ae977758c6365664')
sha512sums_x86_64=('d5da23bb7480a3e39eb6942cc09397f6fcad525f77381abbf501ae87908840878c83f1a2c623285e1de58619c83ffae8517b3440053edde0c889ccbd0371fcbb')
sha512sums_i686=('8ec8130f028048f7478e7bc80d8e4eb1fb5f50c6832daa8aafb5544e7826e27a8d9b44e696f5717dcad5b1706f499618112ec5db51d039a1a962643dc161074c')
sha512sums_aarch64=('58fb20d58e4076ef07a1998ddd73f8c10cfed6d3ba70bafd11f34da420695eb84e3c636c472fbeb679044c74e631c4c0c7af5c0866b44cc3352511b542d4788c')
sha512sums_arm6h=('1db6879dc80e13e93bf29b9e2e6894fd8ba3130c66621e3723d67498be3346962ce343bc3daf5f6aa8a4296ccdf0e7554dda7f0410c77b18cf3a961d5945297c')

validpgpkeys=(
	'AC8DC4C096411BA0ACE4F2026814C4235C9FC112'	# Kapow! Release Bot (v0.3.0) <release-bot@kapow>
)

check() {
	gpg --verify "${_name}-${pkgver}-SHA512SUMS.GPG"
	# TODO: verify that the downloaded file's checksum matches the
	# kapow-0.3.0-SHA512SUMS.GPG file
}

package() {
	install -Dm755 "${_name}_$CARCH"	"$pkgdir/usr/bin/${_name}"
}
