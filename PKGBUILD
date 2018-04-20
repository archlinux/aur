# Maintainer: Prasad Kumar
# Author: Vitor Lopes <vmnlop@gmail.com>
pkgname=jade-application-kit
pkgver=0.a25
pkgrel=2
pkgdesc="Build desktop applications using web technologies on Linux, with Python, JavaScript, HTML5, and CSS3 and webkit."
arch=('any')
url="https://pypi.org/project/Jade-Application-Kit/"
license=('GPL3')
provides=('jade-application-kit')
conflicts=('jade-application-kit-git')
depends=('python' 'python-gobject' 'webkit2gtk')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/dd/10/6b7c4cacf100a30f9d207256cd79f968cedefa5749cfb0ae99757b6ebd8e/Jade-Application-Kit-${pkgver}.tar.gz")
sha512sums=('1aae2512dd124637078b0b11de50b166e89ee9bacff9b14ee150899fc65fd11fbe7b337d46f579a3702a431dcfca0d3eb05a45b38e4d6188a8e7e74fb3db92c5')

build() {
    cd "${srcdir}"/Jade-Application-Kit-${pkgver}
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}"/Jade-Application-Kit-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
