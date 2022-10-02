# Maintainer: Jason Brown <jason@jasonrbrown.dev>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=wallabag-client
pkgver=1.8.5
pkgrel=1
pkgdesc="Command line client for the self hosted read-it-later app Wallabag"
arch=('any')
url="https://github.com/artur-shaik/wallabag-client"
license=('MIT')
makedepends=('python-setuptools' 'python-wheel')
depends=('python-beautifulsoup4' 'python-pycryptodome' 'python-requests' 'python-click' 'python-click-spinner' 
 'python-click-repl' 'python-pyxdg' 'python-colorama' 'python-delorean' 'python-humanize'
 'python-lxml' 'python-tzlocal' 'python-tabulate' 'python-packaging' 'python-markdownify')
options=(!emptydirs)
source=(https://pypi.io/packages/source/w/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('50cf41bf54f3fe0ccf2238a0fb9a3a2b5bf4ede26925b5abad4d8dab23d2b70c')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
