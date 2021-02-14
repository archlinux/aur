# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-fetch
pkgver=1.8.3
pkgrel=2
epoch=1
pkgdesc="Download and unpack repositories or archives"
arch=('any')
url="https://github.com/mulle-sde/mulle-fetch"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=3.3.0')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-fetch/archive/1.8.3.tar.gz")
noextract=()
md5sums=('bcf931cbce81d56976a59839fa28afa8')
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
