# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=yojenkins
pkgver=0.1.2
pkgrel=2
pkgdesc="A CLI tool to interface with Jenkins"
arch=('any')
url="https://www.yojenkins.com/"
license=('GPL-3.0-or-later')
makedepends=('python-setuptools')
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
sha512sums=('40757b949238d11ab5b5be10ba6ef5f6f6faa2236768dfd51fb3f9be04871532fe7f747b59bc7623b903274e90e87d42bcb4b8bced3a2a4e930d761a844d770b')

makedepends=(python-installer python-wheel)

package() {
    python -m installer --destdir="$pkgdir" $_wheel
}
