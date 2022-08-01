# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-platform
pkgver=1.0.1
pkgrel=1
epoch=1
pkgdesc="Query platform specifica and search for libraries"
arch=('any')
url="https://github.com/mulle-sde/mulle-platform"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=4.1.1')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-platform/archive/1.0.1.tar.gz")
noextract=()
md5sums=('dd1f72935cc62fde9e75bdf344733842')
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
