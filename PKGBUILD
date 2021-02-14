# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-bashfunctions
pkgver=3.3.0
pkgrel=2
epoch=1
pkgdesc="A versioned collection of bash functions"
arch=('any')
url="https://github.com/mulle-nat/mulle-bashfunctions"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-nat/mulle-bashfunctions/archive/3.3.0.tar.gz" "package.patch")
noextract=()
md5sums=('0f508da1eccc4c70ca550940df00b678' '3222c21df709caffed8a43307a6b0c31')
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
