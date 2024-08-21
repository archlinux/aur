# Maintainer: Joshua Smith <smolsheep@opensuse.org>

pkgname=iamb-bin
_pkg=iamb
pkgver=0.0.10
pkgrel=1
pkgdesc='A Matrix client for Vim addicts'
url='https://github.com/ulyssa/iamb'
arch=('x86_64')
license=('Apache-2.0')
makedepends=('git')
conflicts=('iamb')
provides=('iamb')
source=("https://github.com/ulyssa/iamb/releases/download/v${pkgver}/iamb-x86_64-unknown-linux-musl.tgz")
b2sums=('ee1f8ab0c1de59ec4363ea094a438a4df9766065b380a7b55a20810e3ec2c70c492fa6cb563d6b9586a9bc3abec3ed7c3b22390eb62ed567ddbb9bd75ecaf178')

package() {

	cd $srcdir/iamb-x86_64-unknown-linux-musl

	# License
	install -vDm 644 -t "${pkgdir}/usr/share/licenses/${_pkg}" LICENSE

	# Manpages
	install -vDm 644 -t "${pkgdir}/usr/share/man/man1/" docs/${_pkg}.1
	install -vDm 644 -t "${pkgdir}/usr/share/man/man5/" docs/${_pkg}.5

	# Documentation
	install -vDm 644 -t "${pkgdir}/usr/share/doc/${_pkg}" docs/config.example.toml

	# Application
	install -vDm 644 -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/" docs/iamb.svg
	install -vDm 644 -t "${pkgdir}/usr/share/metainfo/" docs/iamb.metainfo.xml
	install -vDm 644 -t "${pkgdir}/usr/share/applications/" docs/iamb.desktop

	# Binary
	install -vDm 755 -t "${pkgdir}/usr/bin" iamb
}
