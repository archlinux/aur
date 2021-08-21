# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-monitor
pkgver=0.9.2
pkgrel=1
epoch=1
pkgdesc="‍ Extensible filesystem observation with callbacks"
arch=('any')
url="https://github.com/mulle-sde/mulle-monitor"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash' 'mulle-bashfunctions>=3.4.0')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-sde/mulle-monitor/archive/0.9.2.tar.gz")
noextract=()
md5sums=('f79fdaab70c8197b53270dc4c0bb142c')
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
