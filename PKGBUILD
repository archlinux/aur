# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: nmeum <nmeum-aur@8pit.net>

pkgname=tpm
pkgver=1.2
pkgrel=2
pkgdesc='tiny password manager'
url='http://github.com/nmeum/tpm'
license=('GPL')
arch=('i686' 'x86_64')
depends=('gnupg')
source=("https://github.com/nmeum/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('348e172a7340535f2d507cd23350d5c635d489f942424e871169375ffe416e59')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install

  install -Dm644 zsh_completion "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 bash_completion "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
}
