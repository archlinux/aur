# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-sourcetree
pkgver=0.23.1
pkgrel=1
epoch=1
pkgdesc="Project composition and maintenance with build support"
arch=('any')
url="https://github.com/mulle-sde/mulle-sourcetree"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=3.3.0')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-sourcetree/archive/0.23.1.tar.gz")
noextract=()
md5sums=('b3d7027643c95b5abb7bcabd237637e6')
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
    mkdir -p "lib/${pkgname}"
    mv libexec/* "lib/${pkgname}"
    rm -r libexec
}
