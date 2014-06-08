# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>

pkgname=cover_grabber
pkgver=1.2.1
pkgrel=1
pkgdesc="Recursively traverse directory containing media files (MP3, ogg, FLAC) and download album cover art"
arch=('any')
url="http://sourceforge.net/projects/covergrabber/"
license=('GPL')
depends=('python' 'mutagen')
source=("http://garr.dl.sourceforge.net/project/covergrabber/${pkgname}-${pkgver}.tar.gz")
md5sums=('3d173171cb3c19e3f33cb42dbae224b6')

prepare()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed '1 s/python$/python2/' -i bin/covergrabber
	sed '1 s/python$/python2/' -i setup.py
}

package()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	./setup.py install --root="${pkgdir}"
}
