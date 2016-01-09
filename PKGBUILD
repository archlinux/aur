# Maintainer: Aaron Marcher <info at nulltime dot net>

pkgname=early-issue-git
pkgver=2.ee48259
pkgrel=1
pkgdesc='Simple initpcio hook, which displays the file /etc/early-issue in early boot.'
arch=('any')
url="https://www.nulltime.net/"
license=('GPL2')
depends=('mkinitcpio')
source=('git+http://github.com/drkh5h/early-issue')
md5sums=('SKIP')

pkgver() {
  cd early-issue
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -D -m644 "${srcdir}/early-issue/early-issue.hook" \
    "${pkgdir}/usr/lib/initcpio/hooks/early-issue"
  install -D -m644 "${srcdir}/early-issue/early-issue.install" \
    "${pkgdir}/usr/lib/initcpio/install/early-issue"
  install -D -m644 "${srcdir}/early-issue/early-issue.txt" \
    "${pkgdir}/etc/early-issue"
  install -D -m644 "${srcdir}/early-issue/README.md" \
    "${pkgdir}/usr/share/early-issue/README.md"
  install -D -m644 "${srcdir}/early-issue/LICENSE" \
    "${pkgdir}/usr/share/early-issue/LICENSE"
}
