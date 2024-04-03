# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=flutter-engine
pkgver=1.0.3
pkgrel=1
epoch=1
pkgdesc='Engine for flutter applications.'
url='https://github.com/flutter/engine'
arch=('x86_64')
license=('BSD')
depends=()
source=(
	'flutter-engine-prepare.sh'
	'flutter-engine-build.sh'
	'flutter-engine-base.incl')
sha256sums=('d276fe833a189e911693791df048dbf803c9a242676bf1e62ef27f4311ed4ac2'
            '0c3f02c89162eec5d0c8ee6840dd82132f13a3f6375c7d64ef50518a7f3495e8'
            '7459e07cbba59611d4c52a1a7237339fbec5afe919fc818274e545464ab24d3a')

package() {
	depends+=(
		'cmake'
		'ninja'
		'git'
		'clang'
		'python'
		'unzip'
		'gtk3'
		'lld'
		'yq'
		'gn'
		'llvm'
		'python-httplib2'
		'python-six')
	install -dm755 "${pkgdir}/opt/flutter-engine"
	
	install -Dm755 'flutter-engine-prepare.sh' "${pkgdir}/opt/flutter-engine/pkgbuild-prepare.sh"
	install -Dm755 'flutter-engine-build.sh' "${pkgdir}/opt/flutter-engine/pkgbuild-build.sh"
	install -Dm644 'flutter-engine-base.incl' "${pkgdir}/opt/flutter-engine/base.incl"
}
