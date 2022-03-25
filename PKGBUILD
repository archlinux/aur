# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
_name=fuo-ytmusic
pkgname=feeluown-ytmusic
pkgver=0.1.1
pkgrel=1
pkgdesc="YouTube Music for FeelUOwn music player"
arch=('any')
url="https://github.com/feeluown/feeluown-ytmusic"
license=('GPL3')
depends=('feeluown' 'python-pydantic' 'python-cachetools' 'python-pytube' 'python-ytmusicapi')
makedepends=('python-setuptools' 'python-pip')
optdepends=('feeluown-netease: Lyric source')
source=(
	"https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=('8e2114366461225616bd48d6bde06240388453b6da893804b39efede817a6735')

build() {
	cd "$_name-$pkgver"
	LANG=en_US.UTF-8 python setup.py build
}

package() {
	cd "$_name-$pkgver"
	LANG=en_US.UTF-8 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
