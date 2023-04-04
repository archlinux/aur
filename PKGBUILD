# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-match
pkgver=1.0.3
pkgrel=1
epoch=1
pkgdesc="Match filenames against a set of .gitignore like patternfiles"
arch=('any')
url="https://github.com/mulle-sde/mulle-match"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=5.0.3')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-match/archive/1.0.3.tar.gz")
noextract=()
md5sums=('31c9f044607fb65be1a725b5d97c4fcc')
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
