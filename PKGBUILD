# Maintainer: Leonidas Arvanitis <l.arvanitis@gmail.com>

pkgname=intellij-jdk
_major=8
_minor=112
_build=251
pkgver=${_major}u${_minor}b${_build}
pkgrel=1
pkgdesc="OpenJDK Java 8 development kit with some fixes and enhancements by JetBrains"
arch=('x86_64')
url="https://intellij-support.jetbrains.com/hc/en-us/articles/206544879-Selecting-the-JDK-version-the-IDE-will-run-under"
license=('GPL2')
depends=( 'java-runtime-common'          'ca-certificates-java'              'java-environment-common' )
provides=("java-runtime=$_major"         "java-runtime-headless=$_major"     "java-environment=$_major"
          "java-runtime-openjdk=$_major" "java-runtime-headless-jre=$_major" "java-environment-openjdk=$_major")
_zipname="jbsdk${pkgver}_x64.tar.gz"
source=("https://dl.bintray.com/jetbrains/intellij-jdk/${_zipname}")
sha1sums=('446a9604f19464180849838f264f27f1ce1f6d55')

package() {
	rm "$srcdir/$_zipname"
	find "$srcdir" -exec chmod g+r,o+r {} +
	mkdir -p "$pkgdir/opt"
	cp -a "$srcdir" "$pkgdir/opt/$pkgname"
}
