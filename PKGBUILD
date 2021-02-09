# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=wallabag-client
pkgver=1.6.4
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
sha512sums=('a5ac9b90c66429843e0b4632a7f2af1ef5e0bc63375321e503f823121e43d6a3cdac9d35c135427a00de4906828c7371ce1dc7d9badf8d69a48b3304ea925ad9')



package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
