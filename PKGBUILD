# Maintainer: Nathan Aclander < nathan dot aclander at gmail >

_name="inputscope"
pkgname="python2-$_name"
url="https://github.com/suurjaak/InputScope"
pkgver=1.1
pkgrel=1
pkgdesc="Mouse and keyboard input heatmap visualizer and statistics."
arch=("any")
url="https://github.com/suurjaak/$_name"
license=("MIT")
makedepends=("python2-setuptools")
depends=("python2-bottle" "python2-pyuserinput-git>=86.9fd2879-1")
source=("https://github.com/suurjaak/InputScope/archive/v$pkgver.tar.gz")
sha256sums=('80fcd548d66012703d8996782c625f20d1fd39b91266dba16a4fdd52a11120e9')

build() {
    cd InputScope-$pkgver/
    python2 setup.py build
}

package() {
    cd InputScope-$pkgver/
    python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}
