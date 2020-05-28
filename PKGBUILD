# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: scolobb <scolobb@colimite.fr>
# Contributor: EEva <eeva+aur@marvid.fr>

pkgbase=montserrat-font
_pkgbase=${pkgbase%-font}
pkgname=("$pkgbase-otf" "$pkgbase-ttf")
pkgver=7.210
pkgrel=1
pkgdesc='Geometric font with Cyrillic and extended Latin support by Julieta Ulanovsky'
url="https://github.com/JulietaUla/${_pkgbase^}"
arch=('any')
license=('OFL')
source=("https://github.com/JulietaUla/${_pkgbase^}/archive/v$pkgver.tar.gz")
sha256sums=('2099ea2d57d5915657ea1c0d4066014ed5fc1a6f8bd87ba5aac2d4a6b4fc54bb')

_package_helper() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/${1^^}/" fonts/$1/${_pkgbase^}*.$1
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt AUTHORS.txt CONTRIBUTORS.txt
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md DESCRIPTION.en_us.html
}

package_montserrat-font-otf() {
  replaces=('otf-montserrat')
  provides=("$pkgbase" 'otf-montserrat')
  conflicts=('otf-montserrat')
  cd "${_pkgbase^}-$pkgver"
  _package_helper otf
}

package_montserrat-font-ttf() {
  replaces=('ttf-montserrat')
  provides=("$pkgbase" 'ttf-montserrat')
  conflicts=('ttf-montserrat')
  cd "${_pkgbase^}-$pkgver"
  _package_helper ttf
}
