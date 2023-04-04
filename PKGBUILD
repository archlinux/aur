# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-semver
pkgver=1.0.2
pkgrel=1
epoch=1
pkgdesc="semantic versioning tool"
arch=('any')
url="https://github.com/mulle-sde/mulle-semver"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=5.0.3')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-semver/archive/1.0.2.tar.gz")
noextract=()
md5sums=('0a225e18c220e04b05891a398ff090b8')
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
