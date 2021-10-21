# Maintainer: eNV25 <env252525@gmail.com>

pkgname=xbps-static-bin
_pkgname_=xbps
pkgver=0.59_5
_pkgver_=0.59
pkgrel=4
pkgdesc='The X Binary Package System (XBPS) -- Static Binaries'
url="https://github.com/void-linux/xbps"
license=('custom: BSD-2-Clause' 'custom: BSD')
provides=('xbps-static' 'xbps')
conflicts=('xbps-static' 'xbps' 'xbps-git')

declare -A _archs_=(
	['x86_64']='x86_64'
	['i686']='i686'
	['armv6h']='armv6l'
	['armv7h']='armv7l'
	['aarch64']='aarch64'
)

arch=("${!_archs_[@]}")

_mirror_='https://alpha.de.repo.voidlinux.org'

noextract=()
for _arch_ in "${!_archs_[@]}"; do
	eval "source_$_arch_=('$_mirror_/static/xbps-static-static-$pkgver.${_archs_["$_arch_"]}-musl.tar.xz')"
	eval "noextract+=('xbps-static-static-$pkgver.${_archs_["$_arch_"]}-musl.tar.xz')"
done

package() {
	bsdtar -xf xbps-static-static-"$pkgver".*.tar.xz -C "$pkgdir/"
}


sha256sums_aarch64=('a5e9cd7462ae253c334f14db7b345e2695a9455b27f9bf5cf7a0452dade6aa8d')
sha256sums_i686=('4ac2e245fb355c8a1cc8ac0ae48e52f4531526896b30fde694ac0e9e5f936d9e')
sha256sums_armv6h=('6ec10b519da9b81a104d6543ac9730fa24f5298d2c131870c9a53279e6391b58')
sha256sums_x86_64=('fb6dd121053f50147790bf81194f5ea96e08f852c0b38b21d607f7fa8f18f19e')
sha256sums_armv7h=('ca62d2c35e372436dc406e0e476ff8c7de1e41ba8042b5dabf06cb4b977b0838')
