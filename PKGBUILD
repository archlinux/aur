# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=wallabag-client
pkgver=1.8.2
pkgrel=1
pkgdesc="Command line client for the self hosted read-it-later app Wallabag"
arch=('any')
url="https://github.com/artur-shaik/wallabag-client"
license=('MIT')
makedepends=('python-setuptools' 'python-wheel')
depends=('python-beautifulsoup4' 'python-pycryptodome' 'python-requests' 'python-click' 'python-click-spinner' 
 'python-click-repl' 'python-pyxdg' 'python-colorama' 'python-setuptools' 'python-delorean' 'python-tzlocal'
 'python-humanize' 'python-lxml' 'python-tabulate' 'python-packaging' 'python-babel' 'python-markdownify')
options=(!emptydirs)
source=(https://github.com/artur-shaik/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('ed2a2730ea5e097c9a7e871e35829c3bdb1616c0a0c8cd7ecbb81c19c2588ff60439f6b20f0788770289ca87f66af964b86558dc9de5622cc177a8118822386d')



package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
