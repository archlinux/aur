# Author: XiLENCE <admin@linux-scout.de>
pkgname=kubedecode-git
_pkgname=kubedecode
pkgver=r16.3a13928
pkgrel=1
pkgdesc="Kubedecode decodes all parts of a Kubernetes secret, no more copypasting!"
arch=('any')
url="https://github.com/mschmidt291/kubedecode"
license=('MIT')
depends=('kubectl')
makedepends=('git')
provides=('kubedecode')
conflicts=('kubedecode')
source=("${pkgname%-*}::git+https://github.com/mschmidt291/kubedecode.git")
sha1sums=('SKIP')

pkgver() {
       cd "$_pkgname"
       printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
       cd "$_pkgname"
       install -Dm755 "bin/kubedecode" "${pkgdir}/usr/bin/kubedecode"
}
