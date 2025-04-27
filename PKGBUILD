# Maintainer: Lothar_m <lothar_m at riseup dot net>
# Contributor: Joakim Reinert <mail+aur@jreinert.com>

_name=icsv2ledger
pkgname=python-icsv2ledger-git
pkgver=r181.97329f6
pkgrel=2
pkgdesc='Interactive importing of CSV files to Ledger'
arch=(any)
url='https://github.com/quentinsf/icsv2ledger'
license=(unknown)
depends=('python')
provides=('python-icsv2ledger')
conflicts=('python-icsv2ledger')
source=(
  "${_name}::git+https://github.com/quentinsf/icsv2ledger.git"
  'icsv2ledgerrc.example'
)

sha512sums=(
  'SKIP'
  '0ad2a270b0177d66bd00d0aa41e78197cd2c8c1f87826173b1cf58b19343462c44bad9601af3dcd79d00b25b9ecd98c06fb43677fa55c1d08b44ea30e571626d'
)

pkgver() {
  cd "$_name"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_name"
  install -Dm755 'icsv2ledger.py' "$pkgdir/usr/bin/$_name"
  install -Dm644 '../icsv2ledgerrc.example' "$pkgdir/usr/share/doc/$_name/icsv2ledgerrc"
}
