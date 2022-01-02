# Maintainer Willy Reinhardt <dev@kurdy.ch>

pkgname=passwd-gen-cli
pkgver=1.0.2
pkgrel=1
pkgdesc="Command line application to generate passwords or a phrase composed of several words. It is possible to use one or more collections as source to create them."
url="https://gitlab.com/kurdy/passwd-gen-cli"
license=('MIT')
source=("${pkgname}-v${pkgver}.tar.gz::https://gitlab.com/kurdy/passwd-gen-cli/-/archive/V1.0.2/passwd-gen-cli-V1.0.2.tar.gz")
sha256sums=('f150c2060b8058df40cb276df7c5a3610e4186059d87d8c5ec2a122457fcab3c')
arch=('any')
_srcpath='passwd-gen-cli-V1.0.2'
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
   dart compile exe ./bin/passwd_gen_cli.dart -o ${pkgdir}/usr/bin/passwd_gen
}
