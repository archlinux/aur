# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgbase='python-resize-image'
pkgname="${pkgbase}"
pkgver='1.1.20'
pkgrel='1'
pkgdesc="A Small python package to easily resize images"
arch=("any")
url="https://github.com/VingtCinq/${pkgbase}"
depends=('python-requests' 'python-pillow')
makedepends=('python' 'python-setuptools')
license=('MIT')
source=("https://pypi.io/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
	"https://raw.githubusercontent.com/VingtCinq/${pkgbase}/master/LICENSE")
sha256sums=('b055dab919d623ece8ec95262d4bdbf006cb1a10e818e9b36221c8b1885f9922'
            'bf3a8525e859c6ce1c4b6b463f65ffbe331480aae194c63e896a56d4d7708f08')

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
