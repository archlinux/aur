# Maintainer: Gyorgy Abraham <gyorgy.abr@gmail.com>
pkgname=awstail
pkgver=1.5
pkgrel=1
pkgdesc='A simple way to see your Amazon CloudWatch logs'
arch=('i686' 'x86_64')
url='https://gitlab.com/godzsa/aws-logs'
license=('custom')
depends=('jdk8-openjdk')
makedepends=('git' 'jdk8-openjdk')
source=('git+https://gitlab.com/godzsa/aws-logs.git')
sha256sums=('SKIP')

build() {
	cd aws-logs
	./gradlew clean build
}

package() {
	cd aws-logs
	install -Dm755 "build/libs/awstail" "${pkgdir}/usr/bin/awstail"
}
