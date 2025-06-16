# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=ape-loader-bin
pkgver=4.0.2
pkgrel=1
pkgdesc="APE loader for the cosmopolitan toolchain"
arch=('x86_64' 'aarch64' 'arm64')
url="https://justine.lol/cosmopolitan/index.html"
license=('ISC')
depends=()
makedepends=("sudo")
optdepends=("cosmocc-bin: Cosmpoiltan compiler (which this is meant to be used with)")
options=("!strip")

source_x86_64=("ape::https://cosmo.zip/pub/cosmos/bin/ape-x86_64.elf")
source_aarch64=("ape::https://cosmo.zip/pub/cosmos/bin/ape-x86_64.elf")
source_arm64=("ape::https://cosmo.zip/pub/cosmos/bin/ape-x86_64.elf")

noextract=("ape")

sha512sums_x86_64=('67da9d68cfa9b252a549bc7415b4f8cc6faaca76441ca980f95e71f8e63653de1ddcf43efa285ad352d90ab5c4fee66bd8eaf0bc0fb71ceb996c1c1cbddeb4b1')
sha512sums_aarch64=('67da9d68cfa9b252a549bc7415b4f8cc6faaca76441ca980f95e71f8e63653de1ddcf43efa285ad352d90ab5c4fee66bd8eaf0bc0fb71ceb996c1c1cbddeb4b1')
sha512sums_arm64=('67da9d68cfa9b252a549bc7415b4f8cc6faaca76441ca980f95e71f8e63653de1ddcf43efa285ad352d90ab5c4fee66bd8eaf0bc0fb71ceb996c1c1cbddeb4b1')

prepare() {
	chmod +x "${srcdir}/ape"
	sudo sh -c "echo ':APE:M::MZqFpD::/usr/bin/ape:' >/proc/sys/fs/binfmt_misc/register" || echo "ape already registered"
	sudo sh -c "echo ':APE-jart:M::jartsr::/usr/bin/ape:' >/proc/sys/fs/binfmt_misc/register" || echo "ape already registered"
}

package() {
	install -Dm755 "$srcdir"/ape "$pkgdir/usr/bin/ape"
}
