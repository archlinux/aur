# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=git-quick-git
pkgver=0.0.0.r5.ga948b44
pkgrel=1
_branch=master
pkgdesc="edit a subset of files from a git repository on any branch"
arch=('x86_64')
url="https://github.com/qwertzguy/${pkgname%-git}"
license=('MIT')
makedepends=('git')
depends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git://github.com/qwertzguy/${pkgname%-git}.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git tag v0.0.0 8c8b03a ||:
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${pkgname%-git}"
    install -Dm 755 {.,$pkgdir/usr/bin}/${pkgname%-git}
}
