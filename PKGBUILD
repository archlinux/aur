# Maintainer: system64 <system64fumo@protonmail.com>

pkgname=jre8-arm
pkgver=8.422.u05
pkgrel=1
pkgdesc="Java 8 runtime for the ARM architecture"
arch=('aarch64')
url="https://openjdk.java.net/"
license=('LicenseRef-Java')
provides=('java-runtime=8' 'java-runtime-openjdk=8')
conflicts=('jre8-openjdk' 'jre8-openjdk-headless')
source=("http://ftp.us.debian.org/debian/pool/main/o/openjdk-8/openjdk-8-jre_8u422-b05-1_arm64.deb"
		"http://ftp.us.debian.org/debian/pool/main/o/openjdk-8/openjdk-8-jre-headless_8u422-b05-1_arm64.deb")
sha256sums=('SKIP'
			'SKIP')

package() {
	ar x openjdk-8-jre_8u422-b05-1_arm64.deb
	tar -xf data.tar.xz
	ar x openjdk-8-jre-headless_8u422-b05-1_arm64.deb
	tar -xf data.tar.xz

	rm -rf usr/share
	rm -rf usr/lib/debug
	rm -rf usr/lib/jvm/java-8-openjdk-arm64/{man,docs,bin}
	rm -rf usr/lib/jvm/java-8-openjdk-arm64/jre/man
	rm usr/lib/jvm/.java-1.8.0-openjdk-arm64.jinfo
	rm usr/lib/jvm/java-1.8.0-openjdk-arm64

	mv usr/lib/jvm/java-8-openjdk-arm64/jre/* usr/lib/jvm/java-8-openjdk-arm64
	rmdir usr/lib/jvm/java-8-openjdk-arm64/jre

	mv etc $pkgdir
	mv usr $pkgdir
}
