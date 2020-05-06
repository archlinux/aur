# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>

pkgver=_
pkgrel=1
pkgname=telepresence-git
pkgdesc="Local development against a remote Kubernetes or OpenShift cluster - http://www.telepresence.io"
arch=('any')
license=('Apache')
url="https://github.com/datawire/telepresence"
makedepends=('git')
backup=()
depends=(
    'curl'
    'conntrack-tools'
    'python-virtualenv'
    'socat'
    'sshfs'
    'torsocks'
    'python-wheel'
)

source=("src::git+https://github.com/datawire/telepresence.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/src
  git describe --abbrev=0
}

package(){
  cd ${srcdir}/src
  env PREFIX=${pkgdir}/usr ./install.sh
}
