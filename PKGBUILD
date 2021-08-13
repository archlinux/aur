# Maintainer: Nafis <mnabid.25@outlook.com>

pkgname=animdl-git
_pkgname=${pkgname%-git}
pkgver=1.3.4+40+g51e6bba
pkgrel=1
pkgdesc="A highly efficient anime downloader and streamer"
arch=('any')
url="https://github.com/justfoolingaround/animdl"
license=('custom:Unlicensed')
depends=('python' 'python-click' 'python-lxml' 'python-tqdm' 'python-requests' 'python-pycryptodomex')
makedepends=('git')
optdepends=(
	'mpv: stream anime'
	'vlc: stream anime'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_pkgname}
	git describe --tags | sed 's/-/+/g'
}

package() {
	cd ${srcdir}/${_pkgname}
	python setup.py install --root=${pkgdir}
}
