pkgname=dockerfile-run-git
pkgver=r1.038aaf3
pkgrel=1
pkgdesc='Execute dockerfiles as scripts (incl. via shebang)'
arch=('any')
url="https://github.com/wknapik/${pkgname%-git}"
license=('MIT')
depends=('bash' 'coreutils' 'curl' 'docker')
optdepends=('ncurses: docker build progress indicator support')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/wknapik/${pkgname%-git}")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir:?}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir:?}/${pkgname%-git}"
    install -D -m755 "${pkgname%-git}" "${pkgdir:?}/usr/bin/${pkgname%-git}"
    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
