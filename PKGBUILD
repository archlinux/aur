# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: nmeum <nmeum-aur@8pit.net>

pkgname=tpm
pkgver=1.3.3
pkgrel=1
pkgdesc='tiny password manager'
url='http://github.com/nmeum/tpm'
license=('GPL')
arch=('any')
depends=('gnupg')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nmeum/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('85930c86b13a08c706c2845a4b09138b43e160ae43e3f5e81021241f31f463ad')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install

  install -Dm644 contrib/zsh_completion "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 contrib/bash_completion "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
}
