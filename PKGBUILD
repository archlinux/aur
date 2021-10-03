# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Nikita Strygin <nikita6@bk.ru>
pkgname=sandboxfs-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A virtual file system for sandboxing "
arch=(x86_64)
url="https://github.com/bazelbuild/sandboxfs"
license=('Apache')
depends=(fuse2)
makedepends=()
source=("https://github.com/bazelbuild/sandboxfs/releases/download/sandboxfs-0.2.0/sandboxfs-0.2.0-20200420-linux-x86_64.tgz")
sha256sums=("435645db70cd817e9b74a8235dcabbb0a575bbeccdf3af8238ac1dc8b27e7a54")

build() {
    # seems to contain only an uninstall script, which is not really needed for a package
    rm -rf "${srcdir}"/libexec
}

package() {
    mkdir -p "$pkgdir/usr/"
    cp -r "${srcdir}"/bin "${srcdir}"/share "$pkgdir/usr/"
}
