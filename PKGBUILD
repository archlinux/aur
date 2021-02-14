# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-match
pkgver=0.7.0
pkgrel=2
epoch=1
pkgdesc="Match filenames against a set of .gitignore like patternfiles"
arch=('any')
url="https://github.com/mulle-sde/mulle-match"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=3.3.0')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-match/archive/0.7.0.tar.gz")
noextract=()
md5sums=('7e845f7862d915960a218857dee3dfb5')
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
