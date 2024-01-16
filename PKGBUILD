# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
_name=fuo-ytmusic
pkgname=feeluown-ytmusic
pkgver=0.3.3
pkgrel=1
pkgdesc="YouTube Music for FeelUOwn music player"
arch=('any')
url="https://github.com/feeluown/feeluown-ytmusic"
license=('GPL-3.0-or-later')
depends=('feeluown' 'python-pydantic' 'python-cachetools' 'python-pytube' 'python-ytmusicapi')
makedepends=('python-setuptools' 'python-pip')
optdepends=('feeluown-netease: Lyric source')
source=(
	"https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=('38e24898f4906462b1eaa9a01ebd561ea769f52c0ff7da7c91a599e733de70e6')

build() {
	cd "$_name-$pkgver"
	LANG=en_US.UTF-8 python setup.py build
}

package() {
	cd "$_name-$pkgver"
	LANG=en_US.UTF-8 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
