# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-template
pkgver=0.0.4
pkgrel=1
epoch=1
pkgdesc="Template generator for text files"
arch=('any')
url="https://github.com/mulle-sde/mulle-template"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=3.4.0')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-template/archive/0.0.4.tar.gz")
noextract=()
md5sums=('9f37be78a74ab926fde8bc5b23502d1e')
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
