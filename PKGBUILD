# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=flutter-engine-google-bin
pkgver=3.13.5
pkgrel=1
pkgdesc='Engine for flutter applications (Binaries from google).'
provides=(flutter-engine)
conflicts=(flutter-engine)
url='https://github.com/flutter/engine'
arch=('x86_64')
license=('BSD')
depends=(
	'cmake'
	'ninja'
	'git'
	'clang'
	'python'
	'unzip'
	'gtk3')
source=(
	'flutter-engine-prepare.sh'
	'flutter-engine-build.sh')
sha256sums=('4e478943b32bb0579253629e06cd2ae606fe70da3b8851d063fbc5cb5a506c4a'
            'dba43ee05d581213721ed0e58ded9fed46508a09906325349749ff8eae7d4017')

package() {
	install -dm755 "${pkgdir}/opt/flutter-engine"
	echo "${pkgver}" > "${pkgdir}/opt/flutter-engine/version"
	
	install -Dm755 'flutter-engine-prepare.sh' "${pkgdir}/opt/flutter-engine/pkgbuild-prepare.sh"
	install -Dm755 'flutter-engine-build.sh' "${pkgdir}/opt/flutter-engine/pkgbuild-build.sh"
}
