# Maintainer: defconxt <trevor@blacktemple.net>
# CIPHER — AI Security Engineering Platform

pkgname=cipher-security
pkgver=5.1.0
pkgrel=1
pkgdesc="AI-powered cybersecurity platform — 1,539 skills, 39 compliance frameworks, autonomous security engine"
arch=('any')
url="https://github.com/defconxt/CIPHER"
license=('AGPL-3.0-only')
depends=('nodejs>=18')
optdepends=(
  'nuclei: vulnerability scanning'
  'katana: web crawling and attack surface discovery'
  'docker: benchmark sandbox and container security testing'
)
makedepends=('npm' 'git')
source=("git+https://github.com/defconxt/CIPHER.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/CIPHER/cli"
  npm install --production
  npm install -g --prefix="${pkgdir}/usr" .
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
}
