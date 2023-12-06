# Maintainer: cvnb <narendrabharathi@gmail.com>
pkgname=gerbil-scheme-bin
_pkgname=gerbil
pkgver=0.18.1
pkgrel=1
pkgdesc="Gerbil is an opinionated dialect of Scheme designed for Systems Programming, with a state of the art macro and module system on top of the Gambit runtime."
arch=(x86_64)
url="https://cons.io"

source_x86_64=("https://github.com/mighty-gerbils/gerbil/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x86-64.tar.gz")
sha256sums_x86_64=("96c72dbf73d8de3e8ebdecf08b78a87d0570ea1e8ac8d638a8dc1be70a731227")

license=('LGPLv2.1' 'Apache 2.0')
depends=('openssl' 'zlib' 'sqlite')
makedepends=('git')
provides=("gerbil-scheme")
conflicts=("gerbil-scheme")

package() {
  cp -ar opt ${pkgdir}/

  mkdir -p ${pkgdir}/etc/profile.d/
  cat <<'EOF' > ${pkgdir}/etc/profile.d/gerbil-scheme.sh
export PATH=/opt/gerbil/bin:$PATH
EOF
}

# vim:set ts=2 sw=2 et:
