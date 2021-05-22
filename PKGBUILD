# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=wallabag-client
pkgver=1.7.1
pkgrel=1
pkgdesc="Command line client for the self hosted read-it-later app Wallabag"
arch=('any')
url="https://github.com/artur-shaik/wallabag-client"
license=('MIT')
makedepends=('python-setuptools' 'python-wheel')
depends=('python-beautifulsoup4' 'python-pycryptodome' 'python-requests' 'python-click' 'python-click-spinner' 
 'python-click-repl' 'python-pyxdg' 'python-colorama' 'python-setuptools' 'python-delorean' 'python-tzlocal'
 'python-humanize' 'python-lxml' 'python-tabulate' 'python-packaging' 'python-babel')
options=(!emptydirs)
source=(https://pypi.io/packages/source/w/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('cf98a8c751d1e4290d06c53d25e3a7c88241e58bce530718d2938d85a3636bc68ef15dc7ce1d1f1bb042939df2c2345565b0144b331a6eeabc1d5acfd34877fe')



package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
