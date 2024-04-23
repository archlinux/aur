# Maintainer: Joshua Smith <smolsheep@opensuse.org>

pkgname=iamb-bin
_pkg=iamb
pkgver=0.0.9
pkgrel=1
pkgdesc='A Matrix client for Vim addicts'
url='https://github.com/ulyssa/iamb'

arch=('x86_64')
license=('Apache-2.0')
makedepends=('git')
conflicts=('iamb')
provides=('iamb')
source=(
	"https://github.com/ulyssa/iamb/releases/download/v${pkgver}/iamb-v${pkgver}-x86_64-unknown-linux-musl.tgz"
	"https://raw.githubusercontent.com/ulyssa/iamb/v${pkgver}/LICENSE"
)
b2sums=(
	'19e107466f129fc79e8088306a7074795878fdbba1600ad2b44d3957c5cee2f8d458d0fe01728dce31413f69a0ada3711aba9680ba9f679b962822c8fcdea75b'
	'43452dd4216bba835bff542c02fcd0a80b77fef97a6f1042adcbbbcf312bb856b0707c35b2f1af356e0b4262e501a159f06bf1f947f182d0023cdd4aefbd8a85'
)

package() {

	install -vDm 644 -t "${pkgdir}/usr/share/licenses/${_pkg}" LICENSE

	cd $srcdir/iamb-v${pkgver}-x86_64-unknown-linux-musl

	# Manpages
	install -vDm 644 -t "${pkgdir}/usr/share/man/man1/" docs/${_pkg}.1
	install -vDm 644 -t "${pkgdir}/usr/share/man/man5/" docs/${_pkg}.5

	# Documentation
	install -vDm 644 -t "${pkgdir}/usr/share/doc/${_pkg}" config.example.toml

	# Binary
	install -vDm 755 -t "${pkgdir}/usr/bin" iamb
}
