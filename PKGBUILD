# Maintainer: Florian Glorioz <florian.glorioz@epitech.eu>
pkgname=normez
pkgver=r121.617849d
pkgrel=1
pkgdesc="Coding-style checker for Epitech students."
arch=('any')
url="https://github.com/ronanboiteau/NormEZ"
license=('MIT')
groups=()
depends=('ruby' 'git')
source=('https://github.com/ronanboiteau/NormEZ/archive/master.zip')
noextract=()
md5sums=('SKIP')

pkgver() {
  git clone https://github.com/ronanboiteau/NormEZ.git "$pkgname"
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 NormEZ.rb "${pkgdir}/usr/bin/${pkgname}"
}