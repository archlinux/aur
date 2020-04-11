# Maintainer: Joseph Smidt <josephsmidt@gmail.com>
# 
pkgname=peass
pkgver=r224.0a5b2b6
pkgrel=1
pkgdesc="Privilege Escalation Awesome Scripts SUITE for Windows and Linux: LinPEAS and WinPEAS."
arch=('any')
url='https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite'
license=('MIT')
depends=('bash')
makedepends=('git')
optdepends=('fping' 'nmap' 'ping' 'gnu-netcat')

source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}" 
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}" 
  install -dm0755 "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -ar --no-preserve=ownership ./* "${pkgdir}/usr/share/${pkgname}"
}
