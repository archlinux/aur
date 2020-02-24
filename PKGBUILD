# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: scolobb <scolobb@colimite.fr>
# Contributor: EEva <eeva+aur@marvid.fr>

pkgbase=montserrat-font
_pkgbase=${pkgbase%-font}
pkgname=("$pkgbase-otf" "$pkgbase-ttf")
pkgver=7.200
pkgrel=5
pkgdesc='Geometric font with Cyrillic and extended Latin support by Julieta Ulanovsky'
url="https://github.com/JulietaUla/${_pkgbase^}"
arch=('any')
license=('OFL')
provides=("$pkgbase")
source=("https://github.com/JulietaUla/${_pkgbase^}/archive/v$pkgver.tar.gz")
sha256sums=('340125df4700876c5adf4df98c885dbe9b96c8a6a0ee634a520934c77ee097dc')

_package_helper() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/${1^^}/" fonts/$1/${_pkgbase^}*.$1
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt AUTHOR.txt CONTRIBUTORS.txt
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md DESCRIPTION.en_us.html
}

package_montserrat-font-otf() {
  replaces=('otf-montserrat')
  provides=('otf-montserrat')
  conflicts=('otf-montserrat')
  cd "${_pkgbase^}-$pkgver"
  _package_helper otf
}

package_montserrat-font-ttf() {
  replaces=('ttf-montserrat')
  provides=('ttf-montserrat')
  conflicts=('ttf-montserrat')
  cd "${_pkgbase^}-$pkgver"
  _package_helper ttf
}
