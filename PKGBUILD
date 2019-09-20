# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>
pkgname=ffmpeg-normalize
pkgver=1.15.2
pkgrel=1
pkgdesc="Audio normalization using ffmpeg."
arch=(any)
url="https://github.com/slhck/ffmpeg-normalize"
license=(MIT)
depends=(ffmpeg python python-tqdm)
makedepends=(python-setuptools python-pypandoc)
conflicts=("${pkgname}-git")
source=("https://github.com/slhck/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('1994ecbf896b0a883c28c2d12fdeeb2f2b48b274a91f298c6260ac67a366959c8d536825639ee3d06c7721d9a6da090340eec90e595ac719eb1b3742327d9554')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
