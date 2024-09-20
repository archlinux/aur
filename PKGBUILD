# Maintainer: Aaron Bull Schaefer <aaron@elasticdog.com>
# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs> 

pkgname=transcrypt
pkgver=2.3.0
pkgrel=1
pkgdesc='A script to configure transparent encryption of files within a Git repository'
arch=('any')
url='https://github.com/elasticdog/transcrypt'
license=('MIT')
depends=(
  'git'
  'openssl'
  'util-linux'
  'xxd'
)
optdepends=('gnupg: config import/export support')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9779f5cc972d7e6e83de0770e5391aca95881bc75e101095a6dede4620a8cd28')

package() {
  cd "${pkgname}-${pkgver}/"

  install -m 755 -D transcrypt "${pkgdir}/usr/bin/transcrypt"
  install -m 644 -D man/transcrypt.1 "${pkgdir}/usr/share/man/man1/transcrypt.1"
  install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -m 644 -D contrib/bash/transcrypt "${pkgdir}/usr/share/bash-completion/completions/transcrypt"
  install -m 644 -D contrib/zsh/_transcrypt "${pkgdir}/usr/share/zsh/site-functions/_transcrypt"
}
