# Maintainer: JC Francois <jc.francois@gmail.com>
pkgname=etcetera
pkgver=0.5
pkgrel=2
pkgdesc="Simple command line tool to keep track of changes to config files of a linux system"
arch=("x86_64" "armv6h")
url="https://github.com/jeancf/etcetera"
license=("GPL3")
depends=("python")
optdepends=()
options=()
source=("https://github.com/jeancf/etcetera/archive/v${pkgver}.tar.gz")
backup=("etc/etcetera.conf")
md5sums=('abe3a1ef2b13a7ef1cac2b52a79ba4e0')

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    install -Dm755 etcetera             ${pkgdir}/usr/bin/etcetera
    install -Dm644 commands.py          ${pkgdir}/usr/lib/etcetera/commands.py
    install -Dm644 toolbox.py           ${pkgdir}/usr/lib/etcetera/toolbox.py
    install -Dm755 parser.py            ${pkgdir}/usr/lib/etcetera/parser.py
    install -Dm644 term_colors.py       ${pkgdir}/usr/lib/etcetera/term_colors.py
    install -Dm644 README.md            ${pkgdir}/usr/share/etcetera/README.md
    install -Dm644 etcetera-logo.png    ${pkgdir}/usr/share/etcetera/etcetera-logo.png
    install -Dm644 etcetera.conf        ${pkgdir}/etc/etcetera.conf
    install -Dm644 LICENSE              ${pkgdir}/usr/share/LICENSES/etcetera/LICENSE

    cd ${pkgdir}
    python -m compileall .
}
