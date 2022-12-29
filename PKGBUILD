# Maintainer: griffin <griffin dot z dot s at outlook dot com>

pkgname=upset_cli
# Each commit to master should be treated as a release.
pkgver=2
_commit=7fc1f46165918d891bb0e6a800af3f3991cd68f1
pkgrel=2
pkgdesc="tool used to create and apply UPS patches. CLI fork."
depends=('gcc-libs')
makedepends=('git')
arch=('x86_64')
url="https://github.com/meunierd/upset"
license=('GPL3')
source=("$pkgname::git+https://github.com/cosarara/upset.git#commit=$_commit")
sha256sums=('SKIP')

build() {
    cd "${srcdir}"/$pkgname
    make
}

package() {
    cd "${srcdir}"/$pkgname
    install -Dm 755 "${srcdir}"/$pkgname/upset_cli -t "${pkgdir}"/usr/bin/
}
