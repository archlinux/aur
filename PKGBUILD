# Maintainer: agony <27015 at riseup dot net>

pkgname=transfuse
pkgver=0.6.0
pkgrel=1
pkgdesc="Backup, compress and restore KDE Plasma user configurations"
arch=('any')
url="https://gitlab.com/cscs/transfuse"
license=('Unlicense')
depends=('bash' 'coreutils' 'findutils' 'gawk' 'gzip' 'qt6-tools' 'sed' 'systemd' 'tar')
optdepends=('rsync: faster copying, cp is used without it'
            'sudo: restore the native package list')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d7f549b8736279070fa189fdd35e7a2a610af8f81089d7da60f41595b5eedaf7')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 transfuse -t "${pkgdir}/usr/bin"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
