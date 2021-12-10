# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>

pkgname=nemo-compare
pkgver=5.2.0
pkgrel=1
pkgdesc="Context menu comparison extension for Nemo file manager"
arch=("x86_64" 'i686' 'armv7h' 'aarch64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL3')
groups=('nemo-extensions')
depends=('nemo-python>=3.9.0' 'python-xdg' 'python-gobject')
optdepends=('meld: Install at least one file comparison program'
            'kompare: Additional comparison options (preferred diff, three-way, multi-compare)'
	        'fldiff: Additional comparison options (preferred diff, three-way, multi-compare)'
	        'diffuse: Alternate comparison backend'
	        'kdiff3: Alternate comparison backend')
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('92364ac03be3458d3cdfa39ebd4061babd3926c280459e66f8814a6acc42a6a5')

build() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"
  python ./setup.py build
}

package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"
  python ./setup.py install --prefix=/usr --root="${pkgdir}" \
                            --no-compile -O0
}
