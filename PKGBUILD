# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=yojenkins
pkgver=0.0.85
pkgrel=1
pkgdesc="A CLI tool to interface with Jenkins"
arch=('any')
url="https://www.yojenkins.com/"
license=('GPL3')
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
sha512sums=('23088d39e0290c3c041799bd9e68ff4b003a5c750b7756b0e6420c266d524b6a9809b87cec94a263a7214a73e1774c2695bb0e1d66469c992e2d094d851390fe')

makedepends=(python-installer python-wheel)

package() {
    python -m installer --destdir="$pkgdir" $_wheel
}
