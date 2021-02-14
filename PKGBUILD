# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-platform
pkgver=0.4.2
pkgrel=2
epoch=1
pkgdesc="Query platform specifica and search for libraries"
arch=('any')
url="https://github.com/mulle-sde/mulle-platform"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=3.3.0')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-platform/archive/0.4.2.tar.gz")
noextract=()
md5sums=('88a5fda939aa70f6dc39abc62c3ea747')
validpgpkeys=()

package() {
    # Install License
    cd "${pkgname}-${pkgver}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Run Install
    cd bin
    chmod +x installer
    ./installer "${pkgdir}/usr"

    # Move libexec to lib/$pkgname
    cd "${pkgdir}/usr"
    mkdir -p "lib/"
    mv libexec/* "lib/"
    rm -r libexec
}
