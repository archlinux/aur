# Maintainer: pancho horrillo <pancho at pancho dot name>

_name=kapow
_pkgname="${_name}bang"
pkgname="${_pkgname}-bin"
pkgver=0.5.0
pkgrel=2
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
sha512sums=('1a34b34b162f6e81f2d5de93b9f43e2d62d7660bebe4bce1049d5eae0f1c6d5beaf524c9a5c57d2962e030a2cad352d337c888f9722bd730235b14bbada684e7')
sha512sums_x86_64=('cdd74ebb5cb58524929e0409ea35cf4362ce3f893fedbd801abd3011722b8902b5549733e1cbd667592ba815337795194595f8a5792d0cc61e835a529b3fcc65')
sha512sums_i686=('71d8a367cc9d96bbd2d6662e079110d3a8a156cd2820a4583addc451515b2e3e4a81b0c639d26e2e7faad9afe72399bee4ee876a24789dd950c1ca76f4c4adc6')
sha512sums_aarch64=('4732b03e522b1f7e029d313852b7f47b28ac2c745ab4313e5c986186df3b99a25e588c383a33a62edbcdd846820f3e813fee4897b3ff0b9f3f5f3ae7e0552962')
sha512sums_arm6h=('16778be0afdb69bdecbf97b77ade68bd9c5ac1e9f01780a60d06f8a2f81f3a0c2219c874625ac0bdd8454905cae81b9aea5e4fcf5d6db78cf589baf790822bd0')

validpgpkeys=(
	'B49A5EB04F5445FF4038284A601121279FB033EE'	# Kapow! Release Bot (v0.5.0) <release-bot@kapow>
)

check() {
	gpg --verify "${_name}-${pkgver}-SHA512SUMS.GPG"
	# TODO: verify that the downloaded file's checksum matches the
	# kapow-0.3.0-SHA512SUMS.GPG file
}

package() {
	install -Dm755 "${_name}_$CARCH"	"$pkgdir/usr/bin/${_name}"
}
