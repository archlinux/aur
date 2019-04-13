# Maintainer: JC Francois <jc.francois@gmail.com>
pkgname=etcetera
pkgver=1.0
pkgrel=1
pkgdesc="Simple command line tool to keep track of changes to config files of a linux system"
arch=("x86_64" "armv6h")
url="https://gitlab.com/jeancf/etcetera"
license=("GPL3")
depends=("python")
optdepends=("python-cysystemd")
options=()
backup=("etc/etcetera.conf")
source=("https://gitlab.com/jeancf/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('abd13d4acd151f8923c154d36ce9dc3c')

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
}
