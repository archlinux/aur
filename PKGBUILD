# Maintainer Willy Reinhardt <dev@kurdy.ch>

pkgname=passwd-gen-cli
pkgver=1.0.0rc.1
pkgrel=1
pkgdesc="Command line application to generate passwords or a phrase composed of several words. It is possible to use one or more collections as source to create them."
url="https://bitbucket.org/kurdy/passwd-gen-cli/src/master/"
license=('MIT')
source=("${pkgname}-v${pkgver}.tar.gz::https://bitbucket.org/kurdy/passwd-gen-cli/get/v1.0.0-rc.1.tar.gz")
sha256sums=('41ca9f19b171851be53d76ee84a2afb3925d36b333194213780fac51432081e9')
arch=('any')
_srcpath='kurdy-passwd-gen-cli-f00496002935'
makedepends=('dart')
checkdepends=()
provides=('passwd_gen')
conflicts=('passwd_gen')

check() {
    cd ${_srcpath}
    dart run test -n 'Command line tests'
}

build() {
   return 0
}

package() {
   cd ${_srcpath}
   mkdir -p ${pkgdir}/usr/bin/
   dart2native ./bin/passwd_gen_cli.dart -o ${pkgdir}/usr/bin/passwd_gen
}
