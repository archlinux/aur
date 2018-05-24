# Maintainer mrAppleXZ <mr.applexz@gmail.com> 

pkgname=mkmod-git
pkgrel=1
pkgver=1.3.r0.g50b8665
pkgdesc="A shell script to clone & build the Minecraft mod that uses the Gradle build system."
arch=('any')
url='https://github.com/PearXTeam/mkmod'
license=('GPL3')
makedepends=('git')
optdepends=("gradle: in case of the gradlew file doesn't exist")
source=("$pkgname::git+git://github.com/PearXTeam/mkmod.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"

  install -D -m755 "mkmod.sh" "${pkgdir}/usr/bin/mkmod"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/mkmod"
}