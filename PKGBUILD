# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=wallabag-client
pkgver=1.7.0
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
sha512sums=('13d47cf2e2f827b380dddeedf0c1d837038fd3b9ce7852f72025774ec496eecd484465e5a3ca9cd2306ec18ac817cef66d2e0c020bb1ae7e2494de47bb382667')



package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
