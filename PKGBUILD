# Maintainer: Axilleas Pipinellis <axilleas@archlinux.info>

pkgname=python2-episode-renamer
_pkgname=episode-renamer
pkgver=0.4.6
pkgrel=1
pkgdesc="TV episode renamer SCRIPT"
arch=(any)
url="https://github.com/skorokithakis/episode-renamer"
license=('BSD')
depends=('python2' 'python2-simplejson' 'python2-beautifulsoup3')
makedepends=('python2-distribute')
optdepends=('atomicparsley: To set all the correct tags')
provides=('episoderenamer')
conflicts=('episode-renamer-git')
source=("https://pypi.python.org/packages/source/e/episode-renamer/$_pkgname-$pkgver.tar.gz" "LICENSE")
md5sums=('de4fb7dfac68ab6b78716d0eff4c7a9d' '856bd6790da692386fec07b97fee22ce' )

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python2 setup.py install --root="${pkgdir}" -O1
	install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

