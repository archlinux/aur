# Maintainer: pancho horrillo <pancho at pancho dot name>

_name=kapow
_pkgname="${_name}bang"
pkgname="${_pkgname}-bin"
pkgver=0.5.4
pkgrel=3
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
sha512sums=('678b316851d6a6bf4c6c8f88170fee41e489894403e49d23748f40aa069f8084f3a0081ddb229eee0a51acdc4955c2658c83ccab23e3e69503c896dfcc9a8f93')
sha512sums_x86_64=('81daf7e1c51baeaf210a5d0643f2332560a1bf1d943db7753f5be28e42693528860da5520751811d90145a56bab0d13b116b5d58fb2313928229d76f26ed37ee')
sha512sums_i686=('9be1f21c8680ad88a811aeac55b9bd1ccf4924dc43aaaf9daeccf841329bc9c00348ae787ed494dfb77e4863a09d70aafc778451e3cd5ed8e1758ea46728192c')
sha512sums_aarch64=('e094298b779e238bea7fbeee5f49851cd1805d93474ba777043b74e6cc887303e063b344465731eb8915e30bd8c31d8c9343e161a6aabfa0f90c382656498288')
sha512sums_arm6h=('04567dbae2782b7f0bb9ffc37584fa6a70823f44067c44fd8fd13ab952150d961a55ab4074644d7cac73c4a1b9c7b68f0d0efe43e1caaacee4ea9a4182849beb')

validpgpkeys=(
	'922BB49BE64BA8214B20D442DCFFE3F212C9F94D'	# Kapow! Release Bot (v0.5.4) <release-bot@kapow>
)

check() {
	gpg --verify "${_name}-${pkgver}-SHA512SUMS.GPG"
	# TODO: verify that the downloaded file's checksum matches the
	# kapow-0.5.4-SHA512SUMS.GPG file
}

package() {
	install -Dm755 "${_name}_$CARCH"	"$pkgdir/usr/bin/${_name}"
}
