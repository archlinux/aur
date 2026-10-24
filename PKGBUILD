# Maintainer: agony <27015 at riseup dot net>

pkgname=linux-exploit-suggester
pkgver=1.2
pkgrel=1
pkgdesc="Linux privilege escalation auditing tool"
arch=('any')
url="https://github.com/The-Z-Labs/linux-exploit-suggester"
license=('GPL-3.0-only')
depends=('bash' 'coreutils' 'gawk' 'grep' 'gzip' 'procps-ng' 'sed' 'util-linux')
optdepends=('wget: download exploit sources and binaries with --fetch-sources and --fetch-binaries')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3094b2ae5d2300215718ee4eeb71f4b145b24c58a633e057eecfd7156c68399e')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 linux-exploit-suggester.sh -t "${pkgdir}/usr/bin"
  install -Dm644 README.md CHANGELOG -t "${pkgdir}/usr/share/doc/${pkgname}"
}
