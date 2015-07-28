# Maintainer: Sirat18 <aur@sirat18.de>
# Contributor: fnord0 <fnord0 AT riseup DOT net>

_gitname=wafw00f
pkgname=wafw00f-git
pkgver=0.9.3.r102.ge8ad02c
pkgrel=1
pkgdesc="A set of security tools to identify and fingerprint Web Application Firewall/WAF products protecting a website"
arch=('any')
url="https://github.com/sandrogauci/wafw00f"
license=('GPL')
depends=('python')
makedepends=('git')
provides=('wafw00f')
source=("$_gitname"::'git+https://github.com/sandrogauci/wafw00f.git')
sha512sums=('SKIP')

pkgver() {
	  cd "$_gitname"
	  printf "%s.r%s.g%s" "$(grep '__version__' wafw00f/__init__.py | cut -d "'" -f 2)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
      cd "$srcdir/$_gitname"
	  python setup.py install --root="$pkgdir/" --optimize=1
}
# vim:syntax=sh
