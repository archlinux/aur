# Maintainer: Thomas Haider <t.haider@deprecate.de>
# Contributer: Rich Li <rich@dranek.com>
# Contributer: Filip S. Adamsen <fsa [at] fsadev [dot] com>
# Contributor: Samed Beyribey <ras0ir@eventualis.org>
pkgname=python2-postfix-policyd-spf
_pypkgname=pypolicyd-spf
pkgver=1.3.2
pkgrel=1
pkgdesc="Python2 Postfix Sender Policy Framework (SPF) filter"
arch=('any')
url="http://www.openspf.org/Software"
license=('Apache')
depends=('python2-pyspf' 'python2' 'python2-ipaddr')
optdepends=('python2-authres: support Authentication-Results headers')
conflicts=('python-postfix-policyd-spf')
options=(!emptydirs)
backup=(etc/python-policyd-spf/policyd-spf.conf)
source=(http://launchpad.net/pypolicyd-spf/1.3/$pkgver/+download/$_pypkgname-$pkgver.tar.gz)
sha256sums=('7174c46a26c9c35b0d66ddba821b02b0dc2df9d1f6bf0c9da71dcd60795b2966')
 
build() {
  cd "$srcdir/$_pypkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pypkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -m644 -D policyd-spf.conf.commented $pkgdir/etc/python-policyd-spf
}

# vim:set ts=2 sw=2 et:
