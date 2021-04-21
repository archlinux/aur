# Maintainer: Adler Neves <adlerosn@gmail.com>

provides=('fail2ban-endlessh')
conflicts=('fail2ban-endlessh')
pkgver=0.r.8.8fc4661
pkgname=fail2ban-endlessh-git
pkgrel=1
pkgdesc="Combining the powers of endlessh and fail2ban."
arch=('any')
depends=('fail2ban' 'endlessh-git')
makedepends=()
url="https://github.com/itskenny0/fail2ban-endlessh"
options=()
license=('UNLICENSE')
source=('fail2ban-endlessh::git+https://github.com/itskenny0/fail2ban-endlessh')
sha512sums=('SKIP')

pkgver() {
  cd fail2ban-endlessh
  printf "0.r.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "${pkgdir}/etc/fail2ban/action.d"
  mkdir -p "${pkgdir}/etc/fail2ban/jail.d"
  
  install "${srcdir}/fail2ban-endlessh/action.d/endlessh.conf" "${pkgdir}/etc/fail2ban/action.d/endlessh.conf"
  install "${srcdir}/fail2ban-endlessh/jail.d/endlessh.conf" "${pkgdir}/etc/fail2ban/jail.d/endlessh.conf"
}
