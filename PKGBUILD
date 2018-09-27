# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgname=browsh-bin
pkgver=1.4.13
pkgrel=1
pkgdesc='A fully-modern text-based browser, rendering to TTY and browsers'
arch=('x86_64' 'i386' 'i486' 'i586' 'i686' 'armv6h' 'armv7h' 'aarch64')
url='https://www.brow.sh'
license=('LGPL2.1')
depends=('firefox>=57')
optdepends=('upx: compress binary')
provides=('browsh')
conflicts=('browsh' 'browsh-git')
options=('!strip')
source_x86_64=("https://github.com/${provides[0]}-org/${provides[0]}/releases/download/v${pkgver}/${provides[0]}_${pkgver}_linux_amd64")
source_i386=("https://github.com/${provides[0]}-org/${provides[0]}/releases/download/v${pkgver}/${provides[0]}_${pkgver}_linux_386")
source_i486=($source_i386)
source_i586=($source_i386)
source_i686=($source_i386)
source_armv6h=("https://github.com/${provides[0]}-org/${provides[0]}/releases/download/v${pkgver}/${provides[0]}_${pkgver}_linux_armv6")
source_armv7h=("https://github.com/${provides[0]}-org/${provides[0]}/releases/download/v${pkgver}/${provides[0]}_${pkgver}_linux_armv7")
source_aarch64=("https://github.com/${provides[0]}-org/${provides[0]}/releases/download/v${pkgver}/${provides[0]}_${pkgver}_linux_arm64")

prepare() {
	cat ${provides[0]}_${pkgver}_linux_* > ${provides[0]}
	if [ $(which upx 2>/dev/null) ]; then
		echo Compressing ${provides[0]} with UPX...
		chmod u+x ${provides[0]}
		upx --best ${provides[0]}; fi
}

package() {
	install -Dm755 ${provides[0]} "$pkgdir/usr/bin/${provides[0]}"
}

sha512sums_x86_64=('5ef2d6eb17c49f8e5fd874522e5db8603a44ec32212802b89b2b6c77afd0fe819c14c8df33cfcbee864c8c0857d5580a4326185c65d7d46d854bd63acd8e5743')
sha512sums_i386=('95dd807dfa528855f799c515c2fb5a3700cee05329c6d73965c2e2350fb4bc105bc093103f4182704d51f369ec531e23378360015c272f7a892031efaa072255')
sha512sums_i486=('95dd807dfa528855f799c515c2fb5a3700cee05329c6d73965c2e2350fb4bc105bc093103f4182704d51f369ec531e23378360015c272f7a892031efaa072255')
sha512sums_i586=('95dd807dfa528855f799c515c2fb5a3700cee05329c6d73965c2e2350fb4bc105bc093103f4182704d51f369ec531e23378360015c272f7a892031efaa072255')
sha512sums_i686=('95dd807dfa528855f799c515c2fb5a3700cee05329c6d73965c2e2350fb4bc105bc093103f4182704d51f369ec531e23378360015c272f7a892031efaa072255')
sha512sums_armv6h=('8fdcc6efdca37cf40bcb19a9b0a03fdc5532a7b5f6f225188250a6800bf069e696b60c6c5588e512e722ae3c9c531d323074da157270bb75e585310c6a918fd4')
sha512sums_armv7h=('f46b504b6a7d7d542908ca5e1c6cdbb10d199686f19824f5881c54246bc44f9b2564fbdc5ea524ec6086c4957523039a5301194f34c0882154ae86bce7f6a52a')
sha512sums_aarch64=('256f282f0d8639d60f9043e2fe99846a060cd71e7adbece009196956777e186cc76763edb4fae164cbcfc1a91c3b687ddf9ad3f7db1c10d444eee49ffcca3aad')
