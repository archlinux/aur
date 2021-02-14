# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-make
pkgver=0.15.0
pkgrel=2
epoch=1
pkgdesc="Build projects with tools like cmake, meson, autoconf"
arch=('any')
url="https://github.com/mulle-sde/mulle-make"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=3.3.0')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-make/archive/0.15.0.tar.gz")
noextract=()
md5sums=('aa1a04ba21acab2ae3717003f19aba21')
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
