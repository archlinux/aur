# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: nmeum <nmeum-aur@8pit.net>

pkgname=tpm
pkgver=1.3.1
pkgrel=1
pkgdesc='tiny password manager'
url='http://github.com/nmeum/tpm'
license=('GPL')
arch=('any')
depends=('gnupg')
source=("https://github.com/nmeum/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b73d995d89537b8cf3deee432bf4e510a4f72dd9e8bc3a30112a7b569c47fc35')


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
