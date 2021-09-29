# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=devtools
pkgname="python-${_pkgname}"
pkgver=0.8.0
pkgrel=1
pkgdesc="Python's missing debug print command and other development tools."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python' 'python-asttokens' 'python-executing')
optdepends=('python-pygments: Code highlighting')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/samuelcolvin/python-devtools/archive/v${pkgver}.tar.gz"
        LICENSE)
sha256sums=('a8483eed19edc623a823c7844b6711388928280978fdc8cbd5657c796ecc10a7'
            '95ee67b1fdcfb0df2740c0499f33564cbbfd87fb20d7e4ecbc38f6e25282b28e')
b2sums=('78ab34e06b6b3d6083ff1929b63e6c58dfc73b08121cf8657be7fdb13a4af70ef9811a46f15245aa3856a61b7cdb27dccda2604b397ca92d7183961ef4e9fdd3'
        '5c26d1be5d4ee3c05ac90a8118a23de7ebde909290075cc7c1df4acab355f06417e5a32052f56e313ddaa7cc16d4cfb721c9931dffe58105917180bcae40b719')

build() {
  cd "python-devtools-${pkgver}"

  python setup.py build
}

package() {
  cd "python-devtools-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
