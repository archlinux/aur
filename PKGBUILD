# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-fetch
pkgver=3.1.0
pkgrel=1
epoch=1
pkgdesc="Download and unpack repositories or archives"
arch=('any')
url="https://github.com/mulle-sde/mulle-fetch"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=5.0.3' 'mulle-semver>=1.0.2')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-fetch/archive/3.1.0.tar.gz")
noextract=()
md5sums=('2f69f558cdf8e102ea17628a56956cf7')
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
