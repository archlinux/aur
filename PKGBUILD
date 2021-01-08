# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=wallabag-client
pkgver=1.6.3
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
sha512sums=('cbf9ec6420af8f68febe2d8202b622018319ca87b4851c9e165e0d0b55d46e81082d3945bb60a6d28eca72de7d022214e92ab149f545d5496dc15a48d6ef0fa4')



package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
