# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=i18nspector
pkgver=0.25.8
pkgrel=1
epoch=
pkgdesc="Checking tool for gettext POT, PO and MO files"
arch=('any')
url="http://jwilk.net/software/i18nspector"
license=('MIT')
groups=()
depends=('python' 'python-polib' 'python-rply-git')
makedepends=('python-docutils')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/jwilk/$pkgname/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('c0808e626f89a6f9e0b4df6112cb8042d3cb2d06742fedafb463a599f4e86e18')
validpgpkeys=()

build() {
    cd "${srcdir}"/$pkgname-$pkgver
    make PREFIX=/usr
}

package() {
    cd "${srcdir}"/$pkgname-$pkgver
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
