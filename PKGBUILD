# Maintainer: Tobias Burdow <kaleidox@comroid.org>

pkgname=comroid-java-api-git
pkgver=2
pkgrel=1
pkgdesc="Installs common Java API of comroid Products to mavenLocal()"
arch=('any')
url="https://github.com/comroid-git/japi"
license=('Apache License, Version 2.0')
depends=('java-runtime>=17')
makedepends=('java-environment>=17' 'gradle>=7')
source=("git+https://github.com/comroid-git/japi.git")
md5sums=('SKIP')
options+=("!strip")

build() {
    cd japi
    gradle clean test
}

package() {
    gradle publishToMavenLocal
}
