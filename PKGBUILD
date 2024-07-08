# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=flutter-engine
pkgver=1.0.8
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
sha256sums=('0c3f02c89162eec5d0c8ee6840dd82132f13a3f6375c7d64ef50518a7f3495e8'
            'e74fb8b89cecb779b37fd457e67d7fe35b85f701e40caf7f211ad0b40c97cceb'
            'bc310053f1e61ca2ab2a34dce2309f11eb9627066f46fa3b45d40d303d776231')

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
		'python-six'
		'python311')
	install -dm755 "${pkgdir}/opt/flutter-engine"

	install -Dm755 'flutter-engine-prepare.sh' "${pkgdir}/opt/flutter-engine/pkgbuild-prepare.sh"
	install -Dm755 'flutter-engine-build.sh' "${pkgdir}/opt/flutter-engine/pkgbuild-build.sh"
	install -Dm644 'flutter-engine-base.incl' "${pkgdir}/opt/flutter-engine/base.incl"
}
