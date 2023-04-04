# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-domain
pkgver=1.1.0
pkgrel=1
epoch=1
pkgdesc="URL management and tag resolution for repositories"
arch=('any')
url="https://github.com/mulle-sde/mulle-domain"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=5.0.3')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-domain/archive/1.1.0.tar.gz")
noextract=()
md5sums=('3c6be7a090046728bef679a9ed927a5c')
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
