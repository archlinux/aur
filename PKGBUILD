# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: scolobb <scolobb@colimite.fr>
# Contributor: EEva <eeva+aur@marvid.fr>

pkgbase=montserrat-font
_pkgbase=${pkgbase%-font}
pkgname=("$_pkgbase-otf" "$_pkgbase-ttf")
pkgver=7.222
pkgrel=1
pkgdesc='Geometric font with Cyrillic and extended Latin support by Julieta Ulanovsky'
url="https://github.com/JulietaUla/${_pkgbase^}"
arch=(any)
license=(OFL)
_archive="${_pkgbase^}-$pkgver"
source=("$_archive.tar.gz::https://github.com/JulietaUla/${_pkgbase^}/archive/v$pkgver.tar.gz")
sha256sums=('3adac1da44046c08179560fb0b11ec3607aea3a2dc591c5829a7acdcccab1c74')

_package_helper() {
  cd "$_archive"
  install -Dm0644 -t "$pkgdir/usr/share/fonts/${1^^}/" fonts/$1/${_pkgbase^}*.$1
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt AUTHORS.txt CONTRIBUTORS.txt
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md DESCRIPTION.en_us.html
}

package_montserrat-otf() {
  replaces=(otf-montserrat montserrat-font-otf)
  provides=("$pkgbase" otf-montserrat montserrat-font-otf)
  conflicts=(otf-montserrat)
  _package_helper otf
}

package_montserrat-ttf() {
  replaces=(ttf-montserrat montserrat-font-ttf)
  provides=("$pkgbase" ttf-montserrat montserrat-font-ttf)
  conflicts=(ttf-montserrat)
  _package_helper ttf
}
