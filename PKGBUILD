# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=devtools
pkgname="python-${_pkgname}"
pkgver=0.7.0
pkgrel=2
pkgdesc="Python's missing debug print command and other development tools."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python' 'python-executing')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/samuelcolvin/python-devtools/archive/v${pkgver}.tar.gz"
        LICENSE)
sha256sums=('65e019cbb7a01fdd1bc2c0b48d63dcba7dc1fc57970d4ff57131071e9eac8797'
            '95ee67b1fdcfb0df2740c0499f33564cbbfd87fb20d7e4ecbc38f6e25282b28e')
b2sums=('fa7811a7399ba32b7067e80ef35b3013a008a16e26cc9b545aec0e90b00eb5a0acc0fc2ee44f94e293d1279fc6893c4cf2a4e77f11e46793aff6666fab16668f'
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
