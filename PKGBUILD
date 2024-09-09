# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=yojenkins
pkgver=0.1.1
pkgrel=1
pkgdesc="A CLI tool to interface with Jenkins"
arch=('any')
url="https://www.yojenkins.com/"
license=('GPL-3.0-or-later')
makedepends=('python-setuptools')  # unless it only requires distutils
depends=(
    'bash'
    'python'
    'python-click'
    'python-click-help-colors'
    'python-coloredlogs'
    'python-docker'
    'python-json2xml'
    'python-python-jenkins'
    'python-requests'
    'python-requests-futures'
    'python-simpleaudio'
    'python-toml'
    'python-urllib3'
    'python-xmltodict'
    'python-yaml'
    'python-yaspin'
    )
_wheel=${pkgname//-/_}-$pkgver-py3-none-any.whl
source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/$_wheel")
sha512sums=('5cad52f8c6919676717132019c05e1a02aacbc770cfe66c5dd7d86df260ee2789161afe9621f17e2e89fb1c6cf236a8a908f53a0ed15846e48fc7aa29cd85799')

makedepends=(python-installer python-wheel)

package() {
    python -m installer --destdir="$pkgdir" $_wheel
}
