# Maintainer: pancho horrillo <pancho at pancho dot name>

_name=kapow
_pkgname="${_name}bang"
pkgname="${_pkgname}-bin"
pkgver=0.4.0
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
sha512sums=('4a0ed57573c2de0e6006d4276a92bfb9d33ea57ef41e491ac40d022287160a03466bbf5b998ef4c9c05532def3845d8c03080aee8cd755d85fb6c2d961ee9206')
sha512sums_x86_64=('78230e798a5a576a5c95e6ca4ccb677fb9fcfcedad3f0687cc278f550c5aeee8c6bf962baa17f203f200a99594e8432c767902850eda40acf242da90ffad9f83')
sha512sums_i686=('a94d083cc09e8e8f152a9107fb677362ce0284ccebb3232783ae7712b88cd8ae3e5ffb355129ac25a51041e28178852045568d228812844ba49e41bfdbe1eed4')
sha512sums_aarch64=('4e7a1aafcef494a32c81e28a7368f8de5153055f6d5d822caad5ef7009dcacee0279307e52f2836d6dfbc030cac27cc74d493fd5c170cf7b615aff7044d9210d')
sha512sums_arm6h=('4507385edd758652af45d6a5ef24a7d87fab145919be0d7caf62804ab57d66298e91d49e620ddbd6e5b7bf0385d908cfd2d679b55c2d16935418fbdf66c7fc5c')

validpgpkeys=(
	'51628FBC4016334DA425208EAE2CEBCF0B2BBB23'	# Kapow! Release Bot (v0.4.0) <release-bot@kapow>
)

check() {
	gpg --verify "${_name}-${pkgver}-SHA512SUMS.GPG"
	# TODO: verify that the downloaded file's checksum matches the
	# kapow-0.3.0-SHA512SUMS.GPG file
}

package() {
	install -Dm755 "${_name}_$CARCH"	"$pkgdir/usr/bin/${_name}"
}
