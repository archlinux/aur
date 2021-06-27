# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: RemixDev <RemixDev64@gmail.com>

pkgname="python-deemix"
_name="${pkgname#python-}"
pkgver=3.0.0
pkgrel=1
pkgdesc="A barebone deezer downloader library"
url="https://pypi.org/project/deemix/"
license=("GPL3")
arch=("any")
provides=("deemix")
conflicts=("deemix" "deemix-git")
depends=("python"
         "python-click"
         "python-pycryptodomex"
         "python-mutagen"
         "python-requests"
         "python-spotipy"
         "python-deezer-py")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("efc708062719a3d4e024524697d86990fdb465e5d4098389a951d27633073c02")

build(){
 cd "deemix-$pkgver"
 python setup.py build
}

package(){
 cd "deemix-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
