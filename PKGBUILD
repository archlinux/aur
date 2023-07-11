# Maintainer: IThundxr <contact at ithundxr dot dev>
# Contributor: Travis Weir <tweirtx at gmail dot com>

pkgname=jdk-jetbrains
_major=17
_minor=0.7
_build=1000.6
pkgver=${_major}.${_minor}b${_build}
pkgrel=1
pkgdesc='OpenJDK development kit with some fixes and enhancements by JetBrains'
arch=('x86_64')
url="https://github.com/JetBrains/JetBrainsRuntime/releases"
license=('GPL2')
depends=( 'java-runtime-common'          'ca-certificates-java'              'java-environment-common' )
provides=("java-runtime=$_major"         "java-runtime-headless=$_major"     "java-environment=$_major"
          "java-runtime-openjdk=$_major" "java-runtime-headless-jre=$_major" "java-environment-openjdk=$_major")
replaces=('intellij-jdk' 'jdk-jetbrains')
_zipname="jbr_jcef-${_major}.${_minor}-linux-x64-b${_build}.tar.gz"
source=("${_zipname}::https://cache-redirector.jetbrains.com/intellij-jbr/${_zipname}")
b2sums=('f15cf22a4911c905e6279d629f456fcc05fee537c288e87fdfbea174fa43a7809aa999b8603f4404dd5dfd9ee76788573597be3b141dd32cc87cdec9ec53e7ea')

package() {
  find . -exec chmod g+r,o+r {} +
  mkdir -p "${pkgdir}"/usr/lib/jvm
  cp -a ${_zipname} "${pkgdir}"/usr/lib/jvm/${pkgname}
}
