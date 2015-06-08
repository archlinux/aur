# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname='digitalocean-indicator'
pkgver=0.2.1
pkgrel=1
pkgdesc="Manage Digital Ocean droplets from your desktop"
arch=('any')
url="https://github.com/andrewsomething/digitalocean-indicator"
license=('GPL')
install=$pkgname.install
depends=('python2-distutils-extra' 'libappindicator-gtk3' 'python2-digitalocean')
source=("https://github.com/andrewsomething/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f37f75dbc21ccf7eddb7ac51898717cf6fc45e8257546a38ab2f6bb4c64b4496')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	
	python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	
	python2 setup.py install --prefix=/usr --root="${pkgdir}"
}

# vim: set ts=2 sw=2 ft=sh noet:
