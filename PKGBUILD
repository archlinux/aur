# Maintainer: Aaron Bull Schaefer <aaron@elasticdog.com>
pkgname=transcrypt
pkgver=2.2.1
pkgrel=1
pkgdesc='A script to configure transparent encryption of files within a Git repository'
arch=('any')
url='https://github.com/elasticdog/transcrypt'
license=('MIT')
depends=('git' 'openssl')
optdepends=('gnupg: config import/export support')
source=("https://github.com/elasticdog/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6453d2b2c3f0d903d65d9658d638f40d6e3aeba29ed792919f21477ea570a525')

package() {
  cd "${pkgname}-${pkgver}/"

  install -m 755 -D transcrypt "${pkgdir}/usr/bin/transcrypt"
  install -m 644 -D man/transcrypt.1 "${pkgdir}/usr/share/man/man1/transcrypt.1"
  install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -m 644 -D contrib/bash/transcrypt "${pkgdir}/usr/share/bash-completion/completions/transcrypt"
  install -m 644 -D contrib/zsh/_transcrypt "${pkgdir}/usr/share/zsh/site-functions/_transcrypt"
}
