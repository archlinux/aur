# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-polyscope
pkgver=0.1.2
pkgrel=1
pkgdesc="Python viewer and user interface for 3D data, like meshes and point clouds"
url="https://polyscope.run/py/"
depends=(gcc-libs libx11)
makedepends=(cmake libglvnd libxi libxcursor libxinerama libxrandr python-setuptools)
license=(MIT)
arch=(i686 x86_64 armv6h armv7h)
source=("https://files.pythonhosted.org/packages/58/bc/420255d2142e2e88d42fb17673867e23f2a82d255b0db3c204bf4cb4aa92/polyscope-0.1.2.tar.gz")
sha256sums=('eceecaf3762f1b785726dab2696d23dfd353a43adac032924066a596ebc711b3')

build(){
    cd "polyscope-${pkgver}"
    python setup.py build
}

package(){
    cd "polyscope-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
